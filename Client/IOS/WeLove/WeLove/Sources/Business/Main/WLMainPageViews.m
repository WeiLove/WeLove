//
//  WLMainPageViews.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-23.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLMainPageViews.h"

@implementation WLMainPageView0

@end


@implementation WLMainPageView1

@end


@implementation WLMainPageView2

@end


@implementation WLMainPageView3

@end


@interface WLMainPageView4()

@property(nonatomic, strong) UIButton *taStateBtn; // TA的状态
@property(nonatomic, strong) UIButton *msgBtn; // 消息
@property(nonatomic, strong) UIButton *recordBtn; // 记录
@property(nonatomic, strong) UIButton *myStateBtn; // 我的状态
@property(nonatomic, strong) UIButton *leisureBtn; // 休闲

@end

@implementation WLMainPageView4

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self createTaStateBtn];
        [self addSubview:self.taStateBtn];
        
        [self createMsgBtn];
        [self addSubview:self.msgBtn];
        
        [self createRecordBtn];
        [self addSubview:self.recordBtn];
        
        [self createMyStateBtn];
        [self addSubview:self.myStateBtn];
        
        [self createLeisureBtn];
        [self addSubview:self.leisureBtn];
    }
    
    return self;
}

#pragma mark - private

#pragma mark ______doing

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int numberOfColumns = 2;
    int numberOfRows = 3;
    int marginX = 10;
    int marginY = 10;
    int originX = marginX;
    int originY = marginY;
    
    float width = (CGRectGetWidth(self.frame) - marginX * (numberOfColumns + 1)) / numberOfColumns;
    float height = (CGRectGetHeight(self.frame) - marginY * (numberOfRows + 1)) / numberOfRows;
    
    self.taStateBtn.frame = CGRectMake(originX, originY, width, height);
    self.msgBtn.frame = CGRectMake(CGRectGetMaxX(self.taStateBtn.frame) + marginX, CGRectGetMinY(self.taStateBtn.frame), width, height);
    self.recordBtn.frame = CGRectMake(CGRectGetMinX(self.taStateBtn.frame), CGRectGetMaxY(self.taStateBtn.frame) + marginY, width, height);
    self.myStateBtn.frame = CGRectMake(CGRectGetMaxX(self.recordBtn.frame) + marginX, CGRectGetMinY(self.recordBtn.frame), width, height);
    self.leisureBtn.frame = CGRectMake(CGRectGetMinX(self.recordBtn.frame), CGRectGetMaxY(self.recordBtn.frame) + marginY, width, height);
}

#pragma mark ______create

- (void)createTaStateBtn
{
    if (!self.taStateBtn)
    {
        self.taStateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.taStateBtn.backgroundColor = [UIColor colorWithHex:0xFFEE6DFF];
        [self.taStateBtn setTitle:@"TA" forState:UIControlStateNormal];
        [self.taStateBtn addTarget:self
                            action:@selector(taStateBtnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)createMsgBtn
{
    if (!self.msgBtn)
    {
        self.msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.msgBtn.backgroundColor = [UIColor colorWithHex:0xFF69BE35];
        [self.msgBtn setTitle:@"消息" forState:UIControlStateNormal];
        [self.msgBtn addTarget:self
                        action:@selector(msgBtnClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)createRecordBtn
{
    if (!self.recordBtn)
    {
        self.recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.recordBtn.backgroundColor = [UIColor colorWithHex:0xFFF0A733];
        [self.recordBtn setTitle:@"记录" forState:UIControlStateNormal];
        [self.recordBtn addTarget:self
                           action:@selector(recordBtnClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)createMyStateBtn
{
    if (!self.myStateBtn)
    {
        self.myStateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.myStateBtn.backgroundColor = [UIColor colorWithHex:0xFF5082F0];
        [self.myStateBtn setTitle:@"我" forState:UIControlStateNormal];
        [self.myStateBtn addTarget:self
                            action:@selector(myStateBtnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)createLeisureBtn
{
    if (!self.leisureBtn)
    {
        self.leisureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leisureBtn.backgroundColor = [UIColor colorWithHex:0xFF775FE6];
        [self.leisureBtn setTitle:@"休闲" forState:UIControlStateNormal];
        [self.leisureBtn addTarget:self
                            action:@selector(leisureBtnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark ______clicked

- (void)taStateBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:didClickedTaState:)])
    {
        [self.delegate mainPageView:self didClickedTaState:YES];
    }
}

- (void)msgBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:didClickedMsg:)])
    {
        [self.delegate mainPageView:self didClickedMsg:YES];
    }
}

- (void)recordBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:didClickedRecord:)])
    {
        [self.delegate mainPageView:self didClickedRecord:YES];
    }
}

- (void)myStateBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:didClickedMyState:)])
    {
        [self.delegate mainPageView:self didClickedMyState:YES];
    }
}

- (void)leisureBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:didClickedLeisure:)])
    {
        [self.delegate mainPageView:self didClickedLeisure:YES];
    }
}

@end


@implementation WLMainPageView5

@end


@implementation WLMainPageView6

@end


@implementation WLMainPageView7

@end


@implementation WLMainPageView8

@end