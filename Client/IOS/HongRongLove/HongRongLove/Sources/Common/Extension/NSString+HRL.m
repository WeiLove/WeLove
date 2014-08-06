//
//  NSString+HRL.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "NSString+HRL.h"

@implementation NSString (HRL)

+ (BOOL)stringIsNullOrEmpty:(NSString *)str
{
    BOOL result = NO;
    
    if (nil == str)
    {
        result = YES;
	}
	else if (![str isKindOfClass:[NSString class]])
    {
		result = YES;
	}
	else if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
    {
		result = YES;
	}
    else
    {
        result = NO;
    }
    
	return result;
}

- (NSString *)encodeStr
{
    NSString *encodeStr = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return encodeStr;
}

- (NSString *)decodeStr
{
    NSString *decodeStr = [self stringByRemovingPercentEncoding];
    
    return decodeStr;
}

- (NSString*)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString*)decodeUnicode
{
    NSString* result = [[NSPropertyListSerialization propertyListFromData:[[[@"\"" stringByAppendingString:[[self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"] stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]] stringByAppendingString:@"\""] dataUsingEncoding:NSUTF8StringEncoding] mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL] stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"]; // need autorelease ?
    return result;
}

@end
