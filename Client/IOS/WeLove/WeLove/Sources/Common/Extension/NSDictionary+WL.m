//
//  NSDictionary+WL.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "NSDictionary+WL.h"
#import "NSString+WL.h"

@implementation NSDictionary (WL)

- (NSDictionary*)dictionaryValueForKey:(NSString*)key defaultValue:(NSDictionary*)defaultValue
{
    if (key != nil && [key length] > 0)
    {
        id ret = [self objectForKey:key];
        if (ret != nil && ret != [NSNull null] && [ret isKindOfClass:[NSDictionary class]])
        {
            return ret;
        }
    }
    return defaultValue;
}

- (NSArray*)arrayValueForKey:(NSString*)key defaultValue:(NSArray*)defaultValue
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null] && [ret isKindOfClass:[NSArray class]])
        {
			return ret;
		}
	}
	return defaultValue;
}

- (NSString*)stringValueForKey:(NSString*)key defaultValue:(NSString*)defaultValue operation:(NSStringOperationType)type
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null])
        {
			if ([ret isKindOfClass:[NSString class]])
            {
				switch (type)
                {
					case NSStringOperationTypeDecodeUnicode:
                    {
						return [[ret trim] decodeUnicode];
					}
					case NSStringOperationTypeNone:
                    {
                        return ret;
                    }
                    case NSStringOperationTypeTrim:
					default:
                    {
						return [ret trim];
					}
				}
			}
			else if ([ret isKindOfClass:[NSDecimalNumber class]])
            {
				return [NSString stringWithFormat:@"%@", ret];
			}
			else if ([ret isKindOfClass:[NSNumber class]])
            {
				return [NSString stringWithFormat:@"%@", ret];
			}
		}
	}
	return defaultValue;
}

- (NSDate *)dateValueForKey:(NSString *)key defaultValue:(NSDate *)defaultValue
{
    NSTimeInterval dateTime = [self doubleValueForKey:key
                                         defaultValue:[defaultValue timeIntervalSince1970]];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateTime];
    
    return date;
}

- (NSString *)dateStringForKey:(NSString *)key
                  defaultValue:(NSString *)defaultValue
                  formatString:(NSString *)formatString
{
    if ([NSString stringIsNullOrEmpty:formatString])
    {
        formatString = @"yyyy.MM.dd";
    }
    
    NSTimeInterval dateTime = [self doubleValueForKey:key
                                         defaultValue:0.0f
                                             minValue:0.0f];
    
    if (0.0f == dateTime)
    {
        return defaultValue;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

- (int)intValueForKey:(NSString*)key defaultValue:(int)defaultValue
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null] && ([ret isKindOfClass:[NSDecimalNumber class]] || [ret isKindOfClass:[NSNumber class]] || [ret isKindOfClass:[NSString class]]))
        {
			return [ret intValue];
		}
	}
	return defaultValue;
}

- (int)intValueForKey:(NSString *)key defaultValue:(int)defaultValue minValue:(int)minValue
{
    int returnValue = [self intValueForKey:key defaultValue:defaultValue];
    
    return MAX(returnValue, minValue);
}

- (uint64_t)longLongValueForKey:(NSString*)key defaultValue:(uint64_t)defaultValue
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null] && ([ret isKindOfClass:[NSDecimalNumber class]] || [ret isKindOfClass:[NSNumber class]] || [ret isKindOfClass:[NSString class]]))
        {
			return [ret longLongValue];
		}
	}
	return defaultValue;
}

- (uint64_t)longLongValueForKey:(NSString *)key defaultValue:(uint64_t)defaultValue minValue:(uint64_t)minValue
{
    uint64_t returnValue = [self longLongValueForKey:key
                                        defaultValue:defaultValue];
    
    return MAX(returnValue, minValue);
}

- (double)doubleValueForKey:(NSString*)key defaultValue:(double)defaultValue
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null] && ([ret isKindOfClass:[NSDecimalNumber class]] || [ret isKindOfClass:[NSNumber class]] || [ret isKindOfClass:[NSString class]]))
        {
			return [ret doubleValue];
		}
	}
	return defaultValue;
}

- (double)doubleValueForKey:(NSString *)key defaultValue:(double)defaultValue minValue:(double)minValue
{
    double returnValue = [self doubleValueForKey:key
                                    defaultValue:defaultValue];
    
    return MAX(returnValue, minValue);
}

- (float)floatValueForKey:(NSString*)key defaultValue:(float)defaultValue
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null] && ([ret isKindOfClass:[NSDecimalNumber class]] || [ret isKindOfClass:[NSNumber class]] || [ret isKindOfClass:[NSString class]]))
        {
			return [ret floatValue];
		}
	}
	return defaultValue;
}

- (float)floatValueForKey:(NSString *)key defaultValue:(float)defaultValue minValue:(float)minValue
{
    float returnValue = [self floatValueForKey:key
                                  defaultValue:defaultValue];
    
    return MAX(returnValue, minValue);
}

- (BOOL)boolValueForKey:(NSString*)key defaultValue:(BOOL)defaultValue
{
    if (key != nil && [key length] > 0)
    {
		id ret = [self objectForKey:key];
		if (ret != nil && ret != [NSNull null] && ([ret isKindOfClass:[NSDecimalNumber class]] || [ret isKindOfClass:[NSNumber class]] || [ret isKindOfClass:[NSString class]]))
        {
			return [ret boolValue];
		}
	}
	return defaultValue;
}

- (id)objectForKey:(id)key defaultValue:(id)defaultValue
{
    if (key != nil && [key length] > 0)
    {
        id ret = [self objectForKey:key];
        
        return ret;
    }
    
    return defaultValue;
}

@end
