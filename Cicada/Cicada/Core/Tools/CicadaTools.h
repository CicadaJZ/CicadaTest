//
//  CicadaTools.h
//  Cicada
//
//  Created by 知了 on 2020/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CicadaTools : NSObject

+ (BOOL)isBlankString:(NSString *)string;

+ (UIColor *)colorWithHexString:(NSString *)hexStr;

+ (CGSize)sizeForNoticeTitle:(NSString *)text font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
