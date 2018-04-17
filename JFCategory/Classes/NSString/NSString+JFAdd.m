//
//  NSString+JFAdd.m
//  JFCategory
//
//  Created by junfeng.li on 2018/3/5.
//

#import "NSString+JFAdd.h"

@implementation NSString (JFAdd)

- (NSString *)jf_stringByTrimingBothEndsWhitespaceAndNewline {
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:characterSet];
}

- (NSString *)jf_stringByTrimmingAllWhitespace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)jf_stringByTrimmingAllWhitespaceAndNewline {
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return result;
}

@end
