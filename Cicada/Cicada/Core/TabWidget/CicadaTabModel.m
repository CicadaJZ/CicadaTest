//
//  CicadaTabModel.m
//  Cicada
//
//  Created by 知了 on 2020/11/15.
//

#import "CicadaTabModel.h"

@implementation CicadaTabModel

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    UIFont *font = isSelected ? [UIFont systemFontOfSize:17] : [UIFont systemFontOfSize:15];
    CGSize tabCellSize = [CicadaTools sizeForNoticeTitle:self.title font:font];
    self.tabCellSize = CGSizeMake(tabCellSize.width + self.defaultHalfSpace * 2, 50);
}

@end
