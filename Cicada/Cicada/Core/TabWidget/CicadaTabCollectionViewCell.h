//
//  CicadaTabCollectionViewCell.h
//  Cicada
//
//  Created by 知了 on 2020/11/15.
//

#import <UIKit/UIKit.h>
#import "CicadaTabModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CicadaTabCollectionViewCell : UICollectionViewCell

- (void)handleData:(CicadaTabModel *)model;

@end

NS_ASSUME_NONNULL_END
