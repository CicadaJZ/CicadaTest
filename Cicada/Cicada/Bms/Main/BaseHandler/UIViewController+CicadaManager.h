//
//  UIViewController+CicadaManager.h
//  Cicada
//
//  Created by 知了 on 2020/11/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (CicadaManager)

//设置全局返回按钮
- (void)showBackButton;
//隐藏默认返回按钮
- (void)hideBackButton;
//添加左上角纯图片按钮
- (void)addLeftItemWithImage:(NSString * _Nullable)imageName;
//添加左上角纯文字按钮
- (void)addLeftItemWithTitle:(NSString *_Nullable)title;
//添加右上角纯图片按钮
- (void)addRightItemWithImage:(NSString * _Nullable)imageName;
//添加右上角纯文字按钮
- (void)addRightItemWithTitle:(NSString *_Nullable)title;
//添加左上角按钮，支持多个，数组元素类型为UIImage和NSString
- (void)addLeftItems:(NSArray *)items;
//添加右上角按钮，支持多个，数组元素类型为UIImage和NSString
- (void)addRightItems:(NSArray *)items;
//左上角按钮点击事件
- (void)leftAction;
//右上角按钮点击事件
- (void)rightAction;

@end

NS_ASSUME_NONNULL_END
