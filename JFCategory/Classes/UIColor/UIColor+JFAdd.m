//
//  UIColor+JFAdd.m
//  JFCategory
//
//  Created by junfeng.li on 2018/3/5.
//

#import "UIColor+JFAdd.h"
#import "NSString+JFAdd.h"

@implementation UIColor (JFAdd)

+ (instancetype)jf_colorWithHexString:(NSString *)hexString {
    return [self jf_colorWithHexString:hexString alpha:1.0];
}

+ (instancetype)jf_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *colorHexString = [[hexString jf_stringByTrimingBothEndsWhitespaceAndNewline] uppercaseString];
    NSUInteger length = colorHexString.length;
    
    if (length == 6) {
        BOOL validColorString = YES;
        NSCharacterSet *colorCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"];
        for (NSUInteger i = 0; i < length; i++) {
            validColorString = [colorCharacterSet characterIsMember:[hexString characterAtIndex:i]];
            if (!validColorString) {
                break;
            }
        }
        
        if (validColorString) {
            NSString *red = [hexString substringWithRange:NSMakeRange(0, 2)];
            NSString *green = [hexString substringWithRange:NSMakeRange(2, 2)];
            NSString *blue = [hexString substringWithRange:NSMakeRange(4, 2)];
            
            unsigned int r, g, b;
            
            [[NSScanner scannerWithString:red] scanHexInt:&r];
            [[NSScanner scannerWithString:green] scanHexInt:&g];
            [[NSScanner scannerWithString:blue] scanHexInt:&b];
            
            return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
        } else {
#if DEBUG
            NSLog(@"%@, %@", NSStringFromSelector(_cmd), @"hexString 存在无效的字符。");
#endif
            return [UIColor clearColor];
        }
    } else {
#if DEBUG
        NSLog(@"%@, %@", NSStringFromSelector(_cmd), @"hexString 长度必须等于 6。");
#endif
        return [UIColor clearColor];
    }
}

@end
