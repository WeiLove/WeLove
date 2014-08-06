//
//  HRLRPCRequest.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-6.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLRPCRequest.h"
#import "HRLBaseDataModel.h"

@interface HRLRPCRequest()


@end

@implementation HRLRPCRequest

- (id)startRequest
{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:self.url]];

    if (self.isPost)
    {
        for (NSString *key in self.postDict.allKeys)
        {
            NSString *value = [self.postDict objectForKey:key defaultValue:@""];
            
            [request addPostValue:value forKey:key];
        }
        
        [request setRequestMethod:@"POST"];
    }
    
    [request startSynchronous];
    
    HRLBaseDataModel *dataModel = [[self.parseCls alloc] init];

    if (!request.error && request.responseString)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[request.responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:NULL];
        [dataModel parse:jsonDict];
    }
    else
    {
        //错误特殊处理
        dataModel.errorCode = request.error.code;
        dataModel.errorMsg = request.error.description;
    }
    
    return dataModel;
}

@end
