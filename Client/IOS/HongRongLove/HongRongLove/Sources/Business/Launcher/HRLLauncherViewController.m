//
//  HRLLauncherViewController.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLLauncherViewController.h"
#import "HRLMainViewController.h"
#import "HRLSettingViewController.h"
#import "HRLMapViewController.h"

@interface HRLLauncherViewController()

@property(nonatomic, strong) HRLMainViewController *mainVC;
@property(nonatomic, strong) HRLMapViewController *mapVC;
@property(nonatomic, strong) HRLSettingViewController *settingVC;

@end

@implementation HRLLauncherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self setContentViewControllers];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - private



#pragma mark ______doing

- (void)setContentViewControllers
{
    [self createMainVC];
    [self createMapVC];
    [self createSettingVC];
    
    UINavigationController *mainNavi = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
    UINavigationController *mapNavi = [[UINavigationController alloc] initWithRootViewController:self.mapVC];
    UINavigationController *settgingNavi = [[UINavigationController alloc] initWithRootViewController:self.settingVC];
    self.viewControllers = @[mainNavi, mapNavi, settgingNavi];
}

#pragma mark ______clicked



#pragma mark ______create

- (void)createMainVC
{
    if (!self.mainVC)
    {
        self.mainVC = [[HRLMainViewController alloc] init];
        self.mainVC.title = @"我们";
    }
}

- (void)createMapVC
{
    if (!self.mapVC)
    {
        self.mapVC = [[HRLMapViewController alloc] init];
        self.mapVC.title = @"地图";
    }
}

- (void)createSettingVC
{
    if (!self.settingVC)
    {
        self.settingVC = [[HRLSettingViewController alloc] init];
        self.settingVC.title = @"设置";
    }
}

#pragma mark ______notif



#pragma mark - DataSource



#pragma mark - Delegates



#pragma mark - public




@end
