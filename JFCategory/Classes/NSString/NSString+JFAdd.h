//
//  NSString+JFAdd.h
//  JFCategory
//
//  Created by junfeng.li on 2018/3/5.
//

#import <Foundation/Foundation.h>

@interface NSString (JFAdd)

/**
 去除首尾的空格和换行符

 @return 去除后的字符串
 */
- (NSString *)jf_stringByTrimingBothEndsWhitespaceAndNewline;

/**
 去除字符串中所有的空白字符。

 @return 去除后的字符。
 */
- (NSString *)jf_stringByTrimmingAllWhitespace;

/**
 去除字符串中所有的空白字符和回车换行符。

 @return 去除后的字符。
 */
- (NSString *)jf_stringByTrimmingAllWhitespaceAndNewline;

@end
