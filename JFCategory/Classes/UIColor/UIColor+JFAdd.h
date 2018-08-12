//
//  UIColor+JFAdd.h
//  JFCategory
//
//  Created by junfeng.li on 2018/3/5.
//

#import <UIKit/UIKit.h>

@interface UIColor (JFAdd)

+ (instancetype)jf_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (instancetype)jf_colorWithHexString:(NSString *)hexString;

@end
