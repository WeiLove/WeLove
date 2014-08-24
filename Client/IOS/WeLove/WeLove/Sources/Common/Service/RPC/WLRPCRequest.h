//
//  WLRPCRequest.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-6.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ASIHTTPRequest.h>
#import <ASIFormDataRequest.h>

@class WLBaseDataModel;

@interface WLRPCRequest : NSObject

@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSDictionary *postDict;
@property(nonatomic, assign) Class parseCls;
@property(nonatomic, assign) BOOL isPost;

- (id)startRequest;

@end
