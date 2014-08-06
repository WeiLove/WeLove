//
//  HRLMainPageView.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-23.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRLBaseView.h"

@interface HRLMainPageView0 : HRLBaseView

@end

@interface HRLMainPageView1 : HRLBaseView

@end

@interface HRLMainPageView2 : HRLBaseView

@end

@interface HRLMainPageView3 : HRLBaseView

@end

@protocol HRLMainPageView4Delegate;

@interface HRLMainPageView4 : HRLBaseView

@property(nonatomic, weak) id<HRLMainPageView4Delegate> delegate;

@end

@interface HRLMainPageView5 : HRLBaseView

@end

@interface HRLMainPageView6 : HRLBaseView

@end

@interface HRLMainPageView7 : HRLBaseView

@end

@interface HRLMainPageView8 : HRLBaseView

@end

@protocol HRLMainPageView4Delegate <NSObject>

- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedTaState:(BOOL)willGotoTaState;
- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedMsg:(BOOL)willGotoMsg;
- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedRecord:(BOOL)willGotoRecord;
- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedMyState:(BOOL)willGotoMyState;
- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedLeisure:(BOOL)willGotoLeisure;

@end
