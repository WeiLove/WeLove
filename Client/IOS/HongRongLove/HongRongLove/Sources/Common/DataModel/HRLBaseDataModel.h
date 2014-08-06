//
//  HRLBaseDataModel.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRLBaseDataModel : NSObject

@property(nonatomic, assign) BOOL success;
@property(nonatomic, assign) NSInteger errorCode;
@property(nonatomic, strong) NSString *errorMsg;

- (void)parse:(NSDictionary *)dict;

@end
