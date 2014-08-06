//
//  HRLBaseDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLBaseDataModel.h"

@implementation HRLBaseDataModel

- (void)parse:(NSDictionary *)dict
{
    if (0 == dict.count)
    {
        //数据模型是空的，说明发生了错误
        dict = @{kErrorCode: @kErrorCode_Fail_Normal, kErrorMsg: kErrorMsg_Fail_Normal};
    }
    
    self.errorCode = [dict intValueForKey:kErrorCode
                             defaultValue:0];
    self.errorMsg = [dict stringValueForKey:kErrorMsg
                               defaultValue:@""
                                  operation:NSStringOperationTypeTrim];
    
    //200 - 299成功
    if (self.errorCode >= 200 && self.errorCode <= 299)
    {
        self.success = YES;
    }
    else
    {
        self.success = NO;
    }
}

@end
