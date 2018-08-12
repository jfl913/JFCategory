//
//  NSString+JFAdd.m
//  JFCategory
//
//  Created by junfeng.li on 2018/3/5.
//

#import "NSString+JFAdd.h"

@implementation NSString (JFAdd)

- (NSString *)jf_stringByTrim {
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:characterSet];
}

@end
