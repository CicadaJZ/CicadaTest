//
//  UIViewController+CicadaManager.m
//  Cicada
//
//  Created by 知了 on 2020/11/14.
//

#import "UIViewController+CicadaManager.h"
#import <objc/message.h>

@implementation UIViewController (CicadaManager)

const char *leftItemsAction = "leftItemsAction";
const char *rightItemsAction = "rightItemsAction";

- (void)showBackButton {
    [self addLeftItemWithImage:@"backIcon"];
}

- (void)hideBackButton {
    [self addLeftItemWithImage:@""];
}

- (void)addLeftItemWithImage:(NSString * _Nullable)imageName {
    if ([CicadaTools isBlankString:imageName]) {
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        [self addLeftItems:@[ImageNamed(imageName)]];
    }
}

- (void)addLeftItemWithTitle:(NSString *_Nullable)title {
    if ([CicadaTools isBlankString:title]) {
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        [self addLeftItems:@[title]];
    }
}

- (void)addRightItemWithImage:(NSString * _Nullable)imageName {
    if ([CicadaTools isBlankString:imageName]) {
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        [self addRightItems:@[ImageNamed(imageName)]];
    }
}

- (void)addRightItemWithTitle:(NSString *_Nullable)title {
    if ([CicadaTools isBlankString:title]) {
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        [self addRightItems:@[title]];
    }
}

- (void)addLeftItems:(NSArray *)items {
    NSMutableArray *resItems = @[].mutableCopy;
      [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
          UIBarButtonItem *item;
          if ([obj isKindOfClass:[UIImage class]]) {
              item = [[UIBarButtonItem alloc]initWithImage:obj style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];

          } else {
              item = [[UIBarButtonItem alloc]initWithTitle:obj style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
          }
          objc_setAssociatedObject(self, leftItemsAction, @(idx), OBJC_ASSOCIATION_RETAIN);
          [resItems addObject:item];
      }];
    self.navigationItem.leftBarButtonItems = resItems;
}

- (void)addRightItems:(NSArray *)items {
    NSMutableArray *resItems = @[].mutableCopy;
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBarButtonItem *item;
        if ([obj isKindOfClass:[UIImage class]]) {
            item = [[UIBarButtonItem alloc]initWithImage:obj style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];

        } else {
            item = [[UIBarButtonItem alloc]initWithTitle:obj style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
        }
        objc_setAssociatedObject(self, rightItemsAction, @(idx), OBJC_ASSOCIATION_RETAIN);
        [resItems addObject:item];
    }];
    self.navigationItem.rightBarButtonItems = resItems;
}

/**
 如果是有多个item，重写父类方法，运行时获得点击的是第几个item,做对应的处理
 NSInteger idx = [objc_getAssociatedObject(self, &leftItemsAction) integerValue];
 */
- (void)leftAction {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 如果是有多个item，重写父类方法，运行时获得点击的是第几个item,做对应的处理
 NSInteger idx = [objc_getAssociatedObject(self, &rightItemsAction) integerValue];
 */
- (void)rightAction {
    
}

@end
