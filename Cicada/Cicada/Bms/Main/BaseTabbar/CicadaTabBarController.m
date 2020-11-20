//
//  CicadaTabBarController.m
//  Cicada
//
//  Created by 知了 on 2020/11/12.
//

#import "CicadaTabBarController.h"
#import "BaseNavigationController.h"
#import "CicadaHomeViewController.h"
#import "CicadaDiscoveryViewController.h"
#import "CicadaMineViewController.h"

@interface CicadaTabBarController ()

@end

@implementation CicadaTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTabbar];
    [self addChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self customTabbar];
}

- (void)configTabbar {
    //设置tabbar上文字颜色
    self.tabBar.tintColor = COLOR_RED;
    //设置tabtar背景色
    self.tabBar.backgroundImage = [UIImage getImageWithColor:COLOR_WHITE];
    //隐藏系统tabbar顶部的分割线
    self.tabBar.shadowImage = [UIImage new];
    //设置阴影效果替代替tabbar顶部分割线
    self.tabBar.layer.shadowOffset = CGSizeMake(1, -4);
    self.tabBar.layer.shadowOpacity = 0.1;
    self.tabBar.layer.shadowColor = COLOR_LIGHTGRAY.CGColor;
}

- (void)customTabbar {
    NSArray *titleArr = @[@"首页",@"发现",@"我的"];
    NSArray <NSString *>*imageNames = @[@"home",@"discovery",@"mine"];
    NSArray <NSString *>*selectedImageNames = @[@"homeSelect",@"discoverySelect",@"mineSelect"];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:titleArr[idx] image:ImageNamed(imageNames[idx]) selectedImage:ImageNamed(selectedImageNames[idx])];
        item.titlePositionAdjustment = UIOffsetMake(0, -2);
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12], NSFontAttributeName, nil] forState:UIControlStateNormal];
        obj.tabBarItem = item;
    }];
}

- (void)addChildViewControllers {
    NSArray *classNameArr = @[@"CicadaHomeViewController",
                              @"CicadaDiscoveryViewController",
                              @"CicadaMineViewController"];
    NSMutableArray *viewControllers = @[].mutableCopy;
    for (NSString *className in classNameArr) {
        Class class = NSClassFromString(className);
        UIViewController *vc = [[class alloc]init];
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
}

@end
