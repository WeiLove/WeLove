//
//  WLMapViewController.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-18.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLMapViewController.h"
#import "BMapKit.h"
#import "WLMapService.h"
#import "WLLocationService.h"
#import "MBProgressHUD.h"

@interface WLMapViewController ()<BMKMapViewDelegate>

@property(nonatomic, strong) BMKMapView *mapView;
@property(nonatomic, strong) UIButton *centerMyLocationBtn;
@property(nonatomic, assign) CLLocationCoordinate2D myLocation;
@property(nonatomic, strong) MBProgressHUD *hud;
@property(nonatomic, strong) UISegmentedControl *segCtrl;

@end

@implementation WLMapViewController

-(void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[WLMapService shareInstance] stop];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[WLLocationService shareInstance] startUpdatingLocation];
        [[WLMapService shareInstance] start];
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:kNotification_LocationService_Update
                                                      object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(locationUpdate:)
                                                     name:kNotification_LocationService_Update
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createMapView];
    [self.view addSubview:self.mapView];
    self.mapView.backgroundColor = [UIColor clearColor];

    [self createCenterMyLocationBtn];
    [self.view addSubview:self.centerMyLocationBtn];
    
    if (!self.hud)
    {
        self.hud = [[MBProgressHUD alloc] initWithView:self.view];
        
        self.hud.mode = MBProgressHUDModeIndeterminate;
    }
    
    [self.view addSubview:self.hud];
    
    if (!self.segCtrl)
    {
        self.segCtrl = [[UISegmentedControl alloc] initWithItems:@[@"标准", @"卫星"]];
        
        self.segCtrl.selectedSegmentIndex = 0;
        [self.segCtrl addTarget:self
                         action:@selector(segCtrlValueChanged:)
               forControlEvents:UIControlEventValueChanged];
    }
    
    self.segCtrl.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 120, CGRectGetMinY(self.centerMyLocationBtn.frame), 120, 44);
    
    [self.view addSubview:self.segCtrl];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self centerMyLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - private



#pragma mark ______doing

- (BOOL)hasMyLocation
{
    BOOL hasMyLocation = !(self.myLocation.latitude == 0.0f && self.myLocation.longitude == 0.0f);
    
    return hasMyLocation;
}

- (void)centerMyLocation
{
    if ([WLLocationService isLocationEnabled])
    {
        CLLocation *location = [WLLocationService shareInstance].location;
        self.myLocation = location.coordinate;
        
        if ([self hasMyLocation])
        {
            BMKPointAnnotation *annotationA = [[BMKPointAnnotation alloc] init];
            
            annotationA.coordinate = self.myLocation;
            annotationA.title = @"我的位置";
            
            [self.mapView addAnnotations:@[annotationA]];
            [self.mapView setCenterCoordinate:self.myLocation];
        }
        else
        {
            [[WLLocationService shareInstance] startUpdatingLocation];
        }
    }
    else
    {
        self.hud.labelText = @"请在设置->隐私中开启定位服务";
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:2.0f];
    }
}

- (void)changeMapType
{
    switch (self.segCtrl.selectedSegmentIndex)
    {
        case 0:
        {
            self.mapView.mapType = BMKMapTypeStandard;
            break;
        }
        case 1:
        {
            self.mapView.mapType = BMKMapTypeSatellite;
            break;
        }
        default:
            break;
    }
}

#pragma mark ______clicked

- (void)centerMyLocationBtnClicked:(id)sender
{
    [self centerMyLocation];
}

- (void)segCtrlValueChanged:(id)sender
{
    [self changeMapType];
}

#pragma mark ______create

- (void)createMapView
{
    if (!self.mapView)
    {
        self.mapView = [[BMKMapView alloc] initWithFrame:CGRectZero];
        
        self.mapView.showsUserLocation = YES;
        self.mapView.showMapScaleBar = YES;
        self.mapView.mapType = BMKMapTypeStandard;
        self.mapView.delegate = self;
        [self.mapView setMaxZoomLevel:19];
        [self.mapView setMinZoomLevel:1];
        [self.mapView setZoomLevel:12];
    }
    
    self.mapView.frame = self.view.bounds;
    self.mapView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
}

- (void)createCenterMyLocationBtn
{
    if (!self.centerMyLocationBtn)
    {
        self.centerMyLocationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.centerMyLocationBtn addTarget:self
                                     action:@selector(centerMyLocationBtnClicked:)
                           forControlEvents:UIControlEventTouchUpInside];
        self.centerMyLocationBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.centerMyLocationBtn setTitleColor:[UIColor colorWithHex:0xFF005BFF]
                                       forState:UIControlStateNormal];
        [self.centerMyLocationBtn setTitleColor:[UIColor whiteColor]
                                       forState:UIControlStateHighlighted];
        [self.centerMyLocationBtn setTitle:@"我的位置" forState:UIControlStateNormal];
        self.centerMyLocationBtn.layer.borderColor = [UIColor colorWithHex:0xFF005BFF].CGColor;
        self.centerMyLocationBtn.layer.borderWidth = 1.0f;
        self.centerMyLocationBtn.layer.cornerRadius = 5.0f;
        self.centerMyLocationBtn.clipsToBounds = YES;
        [self.centerMyLocationBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xFF005BFF]
                                                                        size:CGSizeMake(60, 44)] forState:UIControlStateHighlighted];
        self.centerMyLocationBtn.backgroundColor = [UIColor clearColor];
    }
    
    self.centerMyLocationBtn.frame = CGRectMake(10, CGRectGetHeight(self.view.frame) - 44 - CGRectGetHeight(self.tabBarController.tabBar.frame) - 20, 60, 44);
}

#pragma mark ______notif

- (void)locationUpdate:(NSNotification *)notif
{
    NSDictionary *dict = notif.object;
    
    BOOL success = [dict boolValueForKey:kNotification_LocationService_UpdateKey_Success
                            defaultValue:NO];
    CLLocation *newLoc = [dict objectForKey:kNotification_LocationService_UpdateKey_NewLocation
                               defaultValue:nil];
    
    if (success)
    {
        //定位成功
        _myLocation = newLoc.coordinate;
    }
}

#pragma mark - DataSource



#pragma mark - Delegates

#pragma mark ______Map View Delegate

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
	BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
    newAnnotationView.pinColor = BMKPinAnnotationColorRed;
    newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
    newAnnotationView.canShowCallout = YES;
    
    return newAnnotationView ;
}

- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay
{
    if ([overlay isKindOfClass:[BMKPolyline class]])
    {
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:1];
        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        polylineView.lineWidth = 3.0;
        
        return polylineView;
    }
	return nil;
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    
}

#pragma mark - public




@end
