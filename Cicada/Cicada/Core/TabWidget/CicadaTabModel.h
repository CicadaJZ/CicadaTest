//
//  CicadaTabModel.h
//  Cicada
//
//  Created by 知了 on 2020/11/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CicadaTabModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) CGSize tabCellSize;

@property (nonatomic, assign) NSInteger defaultHalfSpace;

@end

NS_ASSUME_NONNULL_END
