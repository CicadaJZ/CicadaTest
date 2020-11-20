//
//  CicadaObjectGroup.m
//  Cicada
//
//  Created by 知了 on 2020/11/16.
//

#import "CicadaObjectGroup.h"

@implementation CicadaObjectGroup

@end

@implementation UIView (CicadaObjectGroup)

+ (UIView *)generatorView:(CGRect)frame backgroundColor:(id)backgroundColor superView:(UIView *)superView {
    UIView *obj = [[UIView alloc]initWithFrame:frame];
    if (backgroundColor)    obj.backgroundColor = backgroundColor;
    if (superView)          [superView addSubview:obj];
    return obj;
}

@end

@implementation UIImageView (CicadaObjectGroup)

+ (UIView *)generatorImageView:(CGRect)frame image:(id)image superView:(UIView *)superView {
    UIImageView *obj = [[UIImageView alloc]initWithFrame:frame];
    
    if ([image isKindOfClass:[NSString class]]) {
        obj.image = ImageNamed(image);
    } else if ([image isKindOfClass:[UIImage class]]) {
        obj.image = image;
    }
    
    if (superView)          [superView addSubview:obj];
    return obj;
}

@end

@implementation UILabel (CicadaObjectGroup)

+ (UILabel *)generatorLabel:(CGRect)frame text:(NSString *)text font:(UIFont *)font textAligment:(NSTextAlignment)textAlignment textColor:(id)textColor backgroundColor:(id)backgroundColor superView:(UIView *)superView {
    UILabel *obj = [[UILabel alloc]initWithFrame:frame];
    if (text)               obj.text = text;
    if (font)               obj.font = font;
    if (textAlignment)      obj.textAlignment = textAlignment;
    if (textColor)          obj.textColor = textColor;
    if (backgroundColor)    obj.backgroundColor = backgroundColor;
    if (superView)          [superView addSubview:obj];
    return obj;
}

@end

@implementation UIButton (CicadaObjectGroup)

+ (UIButton *)generatorButton:(CGRect)frame title:(NSString *)title font:(UIFont *)font textAligment:(NSTextAlignment)textAligment titleColor:(id)titleColor backgroundColor:(id)backgroundColor superView:(UIView *)superView {
    UIButton *obj = [UIButton buttonWithType:UIButtonTypeCustom];
    obj.frame = frame;
    if (font)               obj.titleLabel.font = font;
    if (title)              [obj setTitle:title forState:UIControlStateNormal];
    if (titleColor)         [obj setTitleColor:titleColor forState:UIControlStateNormal];
    if (backgroundColor)    obj.backgroundColor = backgroundColor;
    if (superView)          [superView addSubview:obj];
    return obj;
}

+ (UIButton *)generatorButton:(CGRect)frame image:(id)image selectedImage:(id)selectedImage superView:(UIView *)superView {
    UIButton *obj = [UIButton buttonWithType:UIButtonTypeCustom];
    obj.frame = frame;
    
    if ([image isKindOfClass:[NSString class]]) {
        [obj setImage:ImageNamed(image) forState:UIControlStateNormal];
    } else if ([image isKindOfClass:[UIImage class]]) {
        [obj setImage:image forState:UIControlStateNormal];
    }
    
    if ([selectedImage isKindOfClass:[NSString class]]) {
        [obj setImage:ImageNamed(selectedImage) forState:UIControlStateSelected];
    } else if ([selectedImage isKindOfClass:[UIImage class]]) {
        [obj setImage:selectedImage forState:UIControlStateSelected];
    }
    
    obj.imageView.contentMode = UIViewContentModeCenter;
    if (superView)          [superView addSubview:obj];
    return obj;
}

@end

@implementation UITableView (CicadaObjectGroup)

+ (UITableView *)generatorTableView:(CGRect)frame style:(UITableViewStyle)style delegate:(id)delegate backgroundColor:(id)backgroundColor superView:(UIView *)superView {
    UITableView *obj = [[UITableView alloc]initWithFrame:frame style:style];
    obj.separatorStyle = UITableViewCellSeparatorStyleNone;
    obj.tableFooterView = [UIView new];
    
    UIColor *backColor = backgroundColor ? backgroundColor : COLOR_WHITE;
    obj.backgroundColor = backColor;
    obj.backgroundView = [UIView generatorView:obj.bounds backgroundColor:backColor superView:nil];
    
    if (delegate) {
        obj.delegate = delegate;
        obj.dataSource = delegate;
    }
    
    if (superView)          [superView addSubview:obj];
    return obj;
}

@end

@implementation UICollectionView (CicadaObjectGroup)

+ (UICollectionView *)generatorCollectionView:(CGRect)frame layout:(UICollectionViewLayout *)layout delegate:(id)delegate backgroundColor:(id)backgroundColor registerCell:(NSArray <NSString *>*)registerCell superView:(UIView *)superView {
    
    if (!layout) {
        layout = [[UICollectionViewFlowLayout alloc]init];
    }
    
    UICollectionView *obj = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    
    if (delegate) {
        obj.delegate = delegate;
        obj.dataSource = delegate;
    }
    
    if (backgroundColor) {
        obj.backgroundColor = backgroundColor;
        obj.backgroundView = [UIView generatorView:obj.bounds backgroundColor:backgroundColor superView:nil];
    }
    
    for (NSString *className in registerCell) {
        [obj registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
    }
    
    if (superView)          [superView addSubview:obj];
    return obj;
}

- (void)registerHeader:(NSArray <NSString *>*)registerHeader {
    for (NSString *className in registerHeader) {
        [self registerClass:NSClassFromString(className) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:className];
    }
}

- (void)registerFooter:(NSArray <NSString *>*)registerFooter {
    for (NSString *className in registerFooter) {
        [self registerClass:NSClassFromString(className) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:className];
    }
}

@end
