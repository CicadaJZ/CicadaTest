//
//  BaseNavigationController.m
//  Cicada
//
//  Created by 知了 on 2020/11/12.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //隐藏系统的导航栏底部的分割线
    self.navigationBar.shadowImage = [UIImage new];
    //设置导航背景色
    [self.navigationBar setBackgroundImage:[UIImage getImageWithColor:COLOR_WHITE] forBarMetrics:UIBarMetricsDefault];
    //设置阴影效果代替navigationBar底部分割线
    self.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
    self.navigationBar.layer.shadowOpacity = 0.1;
    self.navigationBar.layer.shadowColor = COLOR_LIGHTGRAY.CGColor;
    //设置状态栏样式
    UIApplication.sharedApplication.statusBarStyle = UIBarStyleDefault;
    //设置导航栏标题字号、颜色
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17], NSForegroundColorAttributeName : COLOR_DARKBLACK};
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    return [super popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    viewController.hidesBottomBarWhenPushed = NO;
}

@end
