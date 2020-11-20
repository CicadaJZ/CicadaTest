//
//  CicadaConfigDefine.h
//  Cicada
//
//  Created by 知了 on 2020/11/12.
//

#ifndef CicadaConfigDefine_h
#define CicadaConfigDefine_h

#define kAppShortVersion        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]


#define isiPhoneXR              CGSizeEqualToSize(CGSizeMake(828,  1792), [[UIScreen mainScreen] currentMode].size)
#define isiPhoneX               CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)
#define isiPhoneXSMax           CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size)

#define isBang                  (isiPhoneX || isiPhoneXSMax || isiPhoneXR)

#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height
#define kStatusBarHeight        (isBang ? 44 : 20)
#define kHotSpot                (isBang ? 0 : 20)
#define kTabbarHeight           (isBang ? 83: 49)
#define kTabbarXHeight          (isBang ? 34: 0)
#define kNavigationBarHeight    44
#define kNavigationHeight       (kStatusBarHeight + kNavigationBarHeight)




#define COLOR_WHITE             [CicadaTools colorWithHexString:@"#ffffff"]
#define COLOR_LIGHTGRAY         [CicadaTools colorWithHexString:@"#999999"]
#define COLOR_DARKBLACK         [CicadaTools colorWithHexString:@"#000000"]
#define COLOR_RED               [CicadaTools colorWithHexString:@"#e84342"]
#define COLOR_BACK              [CicadaTools colorWithHexString:@"#f0f0f0"]

#define AssignmentStr(str)      [CicadaTools isBlankString:str] ? @"--" : str
#define AssignmentEmptyStr(str) [CicadaTools isBlankString:str] ? @"" : str

#define RGBHex(hex)             [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
#define RGBAHex(hex)            [UIColor colorWithRed:((float)((hex & 0xFF000000) >> 24))/255.0 green:((float)((hex & 0xFF0000) >> 16))/255.0 blue:((float)((hex & 0xFF00) >> 8))/255.0 alpha:((float)(hex & 0xFF))/255.0]
#define randomColor             [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]


//加载图片
#define ImageNamed(imageName)   [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]



#endif /* CicadaConfigDefine_h */
