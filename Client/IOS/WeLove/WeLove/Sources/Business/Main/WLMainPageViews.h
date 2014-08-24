//
//  WLMainPageView.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-23.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLBaseView.h"

@interface WLMainPageView0 : WLBaseView

@end

@interface WLMainPageView1 : WLBaseView

@end

@interface WLMainPageView2 : WLBaseView

@end

@interface WLMainPageView3 : WLBaseView

@end

@protocol WLMainPageView4Delegate;

@interface WLMainPageView4 : WLBaseView

@property(nonatomic, weak) id<WLMainPageView4Delegate> delegate;

@end

@interface WLMainPageView5 : WLBaseView

@end

@interface WLMainPageView6 : WLBaseView

@end

@interface WLMainPageView7 : WLBaseView

@end

@interface WLMainPageView8 : WLBaseView

@end

@protocol WLMainPageView4Delegate <NSObject>

- (void)mainPageView:(WLMainPageView4 *)pageView didClickedTaState:(BOOL)willGotoTaState;
- (void)mainPageView:(WLMainPageView4 *)pageView didClickedMsg:(BOOL)willGotoMsg;
- (void)mainPageView:(WLMainPageView4 *)pageView didClickedRecord:(BOOL)willGotoRecord;
- (void)mainPageView:(WLMainPageView4 *)pageView didClickedMyState:(BOOL)willGotoMyState;
- (void)mainPageView:(WLMainPageView4 *)pageView didClickedLeisure:(BOOL)willGotoLeisure;

@end
