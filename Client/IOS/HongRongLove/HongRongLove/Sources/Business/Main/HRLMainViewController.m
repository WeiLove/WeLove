//
//  HRLMainViewController.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLMainViewController.h"
#import "HRLRPCService.h"
#import "MBProgressHUD.h"
#import "HRLUtil.h"
#import "HRLNetWorkService.h"
#import "HRLMainPageViews.h"
#import "HRLTAStateViewController.h"
#import "HRLCurrentWindowAssistView.h"

@interface HRLMainViewController()<HRLMainPageView4Delegate, UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) HRLMainPageView0 *pageView0;
@property(nonatomic, strong) HRLMainPageView1 *pageView1;
@property(nonatomic, strong) HRLMainPageView2 *pageView2;
@property(nonatomic, strong) HRLMainPageView3 *pageView3;
@property(nonatomic, strong) HRLMainPageView4 *pageView4;
@property(nonatomic, strong) HRLMainPageView5 *pageView5;
@property(nonatomic, strong) HRLMainPageView6 *pageView6;
@property(nonatomic, strong) HRLMainPageView7 *pageView7;
@property(nonatomic, strong) HRLMainPageView8 *pageView8;
@property(nonatomic, strong) HRLCurrentWindowAssistView *currentWindowAssistView;

@end

@implementation HRLMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self createContentView];
    [self.view addSubview:self.contentView];
    
    [self createPageView0];
    [self.contentView addSubview:self.pageView0];
    
    [self createPageView1];
    [self.contentView addSubview:self.pageView1];
    
    [self createPageView2];
    [self.contentView addSubview:self.pageView2];
    
    [self createPageView3];
    [self.contentView addSubview:self.pageView3];
    
    [self createPageView4];
    [self.contentView addSubview:self.pageView4];
    
    [self createPageView5];
    [self.contentView addSubview:self.pageView5];
    
    [self createPageView6];
    [self.contentView addSubview:self.pageView6];
    
    [self createPageView7];
    [self.contentView addSubview:self.pageView7];
    
    [self createPageView8];
    [self.contentView addSubview:self.pageView8];
    
    //title view
    [self createCurrentWindowAssistView];
    self.currentWindowAssistView.currentSelectedPage = 4;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.currentWindowAssistView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self layoutSubViews];
}

#pragma mark - private



#pragma mark ______doing

- (void)layoutSubViews
{
    //let contentView 9 pages
    CGSize size = CGSizeMake(CGRectGetWidth(self.contentView.frame) * 3, CGRectGetHeight(self.contentView.frame) * 3);
    self.contentView.contentSize = size;
    
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame));
    
    self.pageView0.frame = frame;
    self.pageView1.frame = CGRectOffset(self.pageView0.frame, CGRectGetWidth(frame), 0);
    self.pageView2.frame = CGRectOffset(self.pageView1.frame, CGRectGetWidth(frame), 0);
    
    self.pageView3.frame = CGRectOffset(self.pageView0.frame, 0, CGRectGetHeight(frame));
    self.pageView4.frame = CGRectOffset(self.pageView3.frame, CGRectGetWidth(frame), 0);
    self.pageView5.frame = CGRectOffset(self.pageView4.frame, CGRectGetWidth(frame), 0);
    
    self.pageView6.frame = CGRectOffset(self.pageView0.frame, 0, CGRectGetHeight(frame));
    self.pageView7.frame = CGRectOffset(self.pageView7.frame, CGRectGetWidth(frame), 0);
    self.pageView8.frame = CGRectOffset(self.pageView8.frame, CGRectGetWidth(frame), 0);
    
    //每次layout完 重置中心页可见
    [self.contentView scrollRectToVisible:self.pageView4.frame animated:NO];
}

- (void)addParallaxEffectToView:(UIView*)view
{
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-10);
    verticalMotionEffect.maximumRelativeValue = @(10);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-10);
    horizontalMotionEffect.maximumRelativeValue = @(10);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    [view addMotionEffect:group];
    
    group = nil;
}

#pragma mark ______clicked


#pragma mark ______create

- (void)createContentView
{
    if (!self.contentView)
    {
        self.contentView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.contentView.showsHorizontalScrollIndicator = NO;
        self.contentView.showsVerticalScrollIndicator = NO;
        self.contentView.pagingEnabled = YES;
        self.contentView.delegate = self;
        [self addParallaxEffectToView:self.contentView];
    }
    
    self.contentView.frame = self.view.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
}

- (void)createPageView0
{
    if (!self.pageView0)
    {
        self.pageView0 = [[HRLMainPageView0 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView1
{
    if (!self.pageView1)
    {
        self.pageView1 = [[HRLMainPageView1 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView2
{
    if (!self.pageView2)
    {
        self.pageView2 = [[HRLMainPageView2 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView3
{
    if (!self.pageView3)
    {
        self.pageView3 = [[HRLMainPageView3 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView4
{
    if (!self.pageView4)
    {
        self.pageView4 = [[HRLMainPageView4 alloc] initWithFrame:CGRectZero];
        self.pageView4.delegate = self;
    }
}

- (void)createPageView5
{
    if (!self.pageView5)
    {
        self.pageView5 = [[HRLMainPageView5 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView6
{
    if (!self.pageView6)
    {
        self.pageView6 = [[HRLMainPageView6 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView7
{
    if (!self.pageView7)
    {
        self.pageView7 = [[HRLMainPageView7 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createPageView8
{
    if (!self.pageView8)
    {
        self.pageView8 = [[HRLMainPageView8 alloc] initWithFrame:CGRectZero];
    }
}

- (void)createCurrentWindowAssistView
{
    if (!self.currentWindowAssistView)
    {
        self.currentWindowAssistView = [[HRLCurrentWindowAssistView alloc] initWithFrame:CGRectZero];
    }
    
    self.currentWindowAssistView.frame = CGRectMake(0, 0, 90, 44);
}

#pragma mark ______notif



#pragma mark - DataSource



#pragma mark - Delegates

#pragma mark ______scrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前是第几个视窗
    CGPoint contentOffset = scrollView.contentOffset;
}

#pragma mark ______pageView4 delegate

- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedTaState:(BOOL)willGotoTaState
{
    if (willGotoTaState)
    {
        HRLTAStateViewController *vc = [[HRLTAStateViewController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedMsg:(BOOL)willGotoMsg
{
    if (willGotoMsg)
    {
        
    }
}

- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedRecord:(BOOL)willGotoRecord
{
    if (willGotoRecord)
    {
        
    }
}

- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedMyState:(BOOL)willGotoMyState
{
    if (willGotoMyState)
    {
        
    }
}

- (void)mainPageView:(HRLMainPageView4 *)pageView didClickedLeisure:(BOOL)willGotoLeisure
{
    if (willGotoLeisure)
    {
        
    }
}

#pragma mark - public




@end

