//
//  CicadaObjectGroup.h
//  Cicada
//
//  Created by 知了 on 2020/11/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CicadaObjectGroup : NSObject

@end

@interface UIView (CicadaObjectGroup)

+ (UIView *)generatorView:(CGRect)frame backgroundColor:(id _Nullable)backgroundColor superView:(UIView *_Nullable)superView;

@end

@interface UIImageView (CicadaObjectGroup)

+ (UIView *)generatorImageView:(CGRect)frame image:(id _Nullable)image superView:(UIView *_Nullable)superView;

@end

@interface UILabel (CicadaObjectGroup)

+ (UILabel *)generatorLabel:(CGRect)frame text:(NSString *_Nullable)text font:(UIFont *_Nullable)font textAligment:(NSTextAlignment)textAlignment textColor:(id _Nullable)textColor backgroundColor:(id _Nullable)backgroundColor superView:(UIView *_Nullable)superView;

@end

@interface UIButton (CicadaObjectGroup)

+ (UIButton *)generatorButton:(CGRect)frame title:(NSString *_Nullable)title font:(UIFont *_Nullable)font textAligment:(NSTextAlignment)textAligment titleColor:(id _Nullable)titleColor backgroundColor:(id _Nullable)backgroundColor superView:(UIView *_Nullable)superView;

+ (UIButton *)generatorButton:(CGRect)frame image:(id _Nullable)image selectedImage:(id _Nullable)selectedImage superView:(UIView *_Nullable)superView;

@end

@interface UITableView (CicadaObjectGroup)

+ (UITableView *)generatorTableView:(CGRect)frame style:(UITableViewStyle)style delegate:(id _Nullable)delegate backgroundColor:(id _Nullable)backgroundColor superView:(UIView *_Nullable)superView;

@end

@interface UICollectionView (CicadaObjectGroup)

+ (UICollectionView *)generatorCollectionView:(CGRect)frame layout:(UICollectionViewLayout *_Nullable)layout delegate:(id _Nullable)delegate backgroundColor:(id _Nullable)backgroundColor registerCell:(NSArray <NSString *>*_Nullable)registerCell superView:(UIView *_Nullable)superView;

- (void)registerHeader:(NSArray <NSString *>*)registerHeader;

- (void)registerFooter:(NSArray <NSString *>*)registerFooter;

@end


NS_ASSUME_NONNULL_END
