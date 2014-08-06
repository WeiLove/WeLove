//
//  HRLCurrentWindowAssistView.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-23.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLCurrentWindowAssistView.h"

@interface HRLCurrentWindowAssistView()

@property(nonatomic, strong) UIButton *pageBtn0;
@property(nonatomic, strong) UIButton *pageBtn1;
@property(nonatomic, strong) UIButton *pageBtn2;
@property(nonatomic, strong) UIButton *pageBtn3;
@property(nonatomic, strong) UIButton *pageBtn4;
@property(nonatomic, strong) UIButton *pageBtn5;
@property(nonatomic, strong) UIButton *pageBtn6;
@property(nonatomic, strong) UIButton *pageBtn7;
@property(nonatomic, strong) UIButton *pageBtn8;
@property(nonatomic, strong) NSMutableArray *pageBtnArray;

@end

@implementation HRLCurrentWindowAssistView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.pageBtn0 = [self button];
        self.pageBtn1 = [self button];
        self.pageBtn2 = [self button];
        self.pageBtn3 = [self button];
        self.pageBtn4 = [self button];
        self.pageBtn5 = [self button];
        self.pageBtn6 = [self button];
        self.pageBtn7 = [self button];
        self.pageBtn8 = [self button];
        
        self.pageBtnArray = [NSMutableArray array];
        
        [self.pageBtnArray addObject:self.pageBtn0 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn1 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn2 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn3 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn4 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn5 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn6 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn7 defaultValue:nil];
        [self.pageBtnArray addObject:self.pageBtn8 defaultValue:nil];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int numberOfColumns = 3;
    int numberOfRows = 3;
    int marginX = 2;
    int marginY = 2;
    int originX = marginX;
    int originY = marginY;
    
    float width = (CGRectGetWidth(self.frame) - marginX * (numberOfColumns + 1)) / numberOfColumns;
    float height = (CGRectGetHeight(self.frame) - marginY * (numberOfRows + 1)) / numberOfRows;
    
    self.pageBtn0.frame = CGRectMake(originX, originY, width, height);
    self.pageBtn1.frame = CGRectOffset(self.pageBtn0.frame, width + marginX, 0);
    self.pageBtn2.frame = CGRectOffset(self.pageBtn1.frame, width + marginX, 0);

    self.pageBtn3.frame = CGRectOffset(self.pageBtn0.frame, 0, height + marginY);
    self.pageBtn4.frame = CGRectOffset(self.pageBtn3.frame, width + marginX, 0);
    self.pageBtn5.frame = CGRectOffset(self.pageBtn4.frame, width + marginX, 0);
    
    self.pageBtn6.frame = CGRectOffset(self.pageBtn3.frame, 0, height + marginY);
    self.pageBtn7.frame = CGRectOffset(self.pageBtn6.frame, width + marginX, 0);
    self.pageBtn8.frame = CGRectOffset(self.pageBtn7.frame, width + marginX, 0);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - private

#pragma mark ______create

- (UIButton *)button
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor redColor] size:CGSizeMake(10, 10)]
                   forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor purpleColor] size:CGSizeMake(1, 1)]
                   forState:UIControlStateSelected];
    
    return btn;
}

#pragma mark - public

- (void)setCurrentSelectedPage:(NSInteger)currentSelectedPage
{
    if (_currentSelectedPage != currentSelectedPage)
    {
        //ded select
        UIButton *btn = [self.pageBtnArray objectAtIndex:_currentSelectedPage defaultValue:nil];
        
        btn.selected = NO;
        _currentSelectedPage = currentSelectedPage;
        btn = [self.pageBtnArray objectAtIndex:_currentSelectedPage defaultValue:nil];
        btn.selected = YES;
    }
}

@end
