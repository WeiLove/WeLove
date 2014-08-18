//
//  WLLauncherViewController.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLLauncherViewController.h"
#import "WLMainViewController.h"
#import "WLSettingViewController.h"
#import "WLMapViewController.h"

@interface WLLauncherViewController()

@property(nonatomic, strong) WLMainViewController *mainVC;
@property(nonatomic, strong) WLMapViewController *mapVC;
@property(nonatomic, strong) WLSettingViewController *settingVC;

@end

@implementation WLLauncherViewController

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
        self.mainVC = [[WLMainViewController alloc] init];
        self.mainVC.title = @"我们";
    }
}

- (void)createMapVC
{
    if (!self.mapVC)
    {
        self.mapVC = [[WLMapViewController alloc] init];
        self.mapVC.title = @"地图";
    }
}

- (void)createSettingVC
{
    if (!self.settingVC)
    {
        self.settingVC = [[WLSettingViewController alloc] init];
        self.settingVC.title = @"设置";
    }
}

#pragma mark ______notif



#pragma mark - DataSource



#pragma mark - Delegates



#pragma mark - public




@end
