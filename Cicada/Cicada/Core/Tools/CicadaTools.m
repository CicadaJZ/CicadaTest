//
//  CicadaTools.m
//  Cicada
//
//  Created by 知了 on 2020/11/12.
//

#import "CicadaTools.h"

@implementation CicadaTools


+ (BOOL)isBlankString:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return YES;
    if (string == nil || string == NULL) return YES;
    if ([string isKindOfClass:[NSNull class]]) return YES;
    if ([string isEqual:[NSNull null]]) return YES;
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) return YES;
    if ([string isEqualToString:@"-"] || [string isEqualToString:@"--"]) return YES;
    return NO;
}

+ (UIColor *)colorWithHexString:(NSString *)hexStr {
    hexStr = [hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([hexStr hasPrefix:@"0x"]) {
        hexStr = [hexStr substringFromIndex:2];
    }
    if([hexStr hasPrefix:@"#"]) {
        hexStr = [hexStr substringFromIndex:1];
    }
    unsigned int hex = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner scanHexInt:&hex];
    if(hexStr.length == 8) {
        return RGBAHex(hex);
    }
    return RGBHex(hex);
}

+ (CGSize)sizeForNoticeTitle:(NSString *)text font:(UIFont *)font{
    CGSize textSize = CGSizeZero;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : style};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(kScreenWidth, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin |         NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
    textSize = rect.size;
    return textSize;
}

@end
