//
//  CicadaTabCollectionViewCell.m
//  Cicada
//
//  Created by 知了 on 2020/11/15.
//

#import "CicadaTabCollectionViewCell.h"


@interface CicadaTabCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *indicatorView;

@end
@implementation CicadaTabCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
    }
    return self;
}

- (void)addViews {
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self addSubview:self.titleLabel];
}

- (void)handleData:(CicadaTabModel *)model {
    self.titleLabel.font = model.isSelected ? [UIFont systemFontOfSize:17] : [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = model.isSelected ? COLOR_RED : COLOR_DARKBLACK;
    self.titleLabel.text = model.title;
    self.titleLabel.frame = CGRectMake(20, 0, model.tabCellSize.width - model.defaultHalfSpace * 2, model.tabCellSize.height);
}

@end
