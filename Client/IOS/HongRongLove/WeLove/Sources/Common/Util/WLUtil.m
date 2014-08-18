//
//  WLUtil.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-20.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLUtil.h"

#define kTag4CallPhone                  10000

@implementation WLUtil

+ (void)callPhoneWithPhoneNumberStr:(NSString *)phoneNumberStr withContainerView:(UIView *)containerView
{
    if (phoneNumberStr && containerView)
    {
        NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phoneNumberStr]];
        UIWebView  *phoneCallWebView = (UIWebView *)[containerView viewWithTag:kTag4CallPhone];
        
        if (!phoneCallWebView || ![phoneCallWebView isKindOfClass:[UIWebView class]])
        {
            phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
            phoneCallWebView.tag = kTag4CallPhone;
        }
        
        [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneUrl]];
        [containerView addSubview:phoneCallWebView];
    }
}


+ (NSString *)compareCurrentTime:(NSDate*)compareDate
{
    NSTimeInterval timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    int temp = 0;
    NSString *result;
    
    if (timeInterval < 5.0f)
    {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if (timeInterval < 60.0f)
    {
        result = [NSString stringWithFormat:@"%d秒前", (int)timeInterval];
    }
    else if((temp = timeInterval / 60.0f) < 60.0f)
    {
        result = [NSString stringWithFormat:@"%d分钟前",temp];
    }
    else if((temp = temp / 60.0f) < 24.0f)
    {
        result = [NSString stringWithFormat:@"%d小时前",temp];
    }
    else if((temp = temp / 24.0f) < 30.0f)
    {
        result = [NSString stringWithFormat:@"%d天前",temp];
    }
    else if((temp = temp / 30.0f) < 12.0f)
    {
        result = [NSString stringWithFormat:@"%d个月前",temp];
    }
    else
    {
        temp = temp / 12.0f;
        result = [NSString stringWithFormat:@"%d年前",temp];
    }
    
    return  result;
}

+ (NSString *)url:(NSString *)baseUrl params:(NSDictionary *)params
{
    NSMutableString *url = [[NSMutableString alloc] init];
    
    if (baseUrl)
    {
        [url appendString:baseUrl];
        
        if (0 != params.count)
        {
            NSArray *allKeys = params.allKeys;
            NSArray *allValues = params.allValues;
            
            [url appendString:@"?"];
            
            for (int i = 0; i < allKeys.count; i++)
            {
                NSString *key = [allKeys objectAtIndex:i defaultValue:@""];
                NSString *value = [allValues objectAtIndex:i defaultValue:@""];
                
                if (i < allValues.count - 1)
                {
                    [url appendString:[NSString stringWithFormat:@"%@=%@&", key, value.encodeStr]];
                }
                else
                {
                    [url appendString:[NSString stringWithFormat:@"%@=%@", key, value.encodeStr]];
                }
            }
        }
    }
    
    return url;
}

@end
