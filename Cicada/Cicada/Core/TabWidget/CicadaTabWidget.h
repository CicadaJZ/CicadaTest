//
//  CicadaTabWidget.h
//  Cicada
//
//  Created by 知了 on 2020/11/15.
//

#import <UIKit/UIKit.h>
#import "CicadaTabHeaderDefine.h"
NS_ASSUME_NONNULL_BEGIN

@class CicadaTabWidget;
@protocol CicadaTabWidgetDelegate <NSObject>

@optional

- (void)tabWidget:(CicadaTabWidget *)tabWidget didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface CicadaTabWidget : UIView

@property (nonatomic, weak)   id <CicadaTabWidgetDelegate> delegate;
@property (nonatomic, strong) NSArray *tabDataSource;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) NSInteger halfSpace;

- (void)selectIndex:(NSInteger)selectIndex finishBlock:(void(^_Nullable)(void))finishBlock;

@end

NS_ASSUME_NONNULL_END
