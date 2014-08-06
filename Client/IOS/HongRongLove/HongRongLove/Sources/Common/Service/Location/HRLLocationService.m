//
//  HRLLocationService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-18.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLLocationService.h"
#import <CoreLocation/CoreLocation.h>

static HRLLocationService *instance = nil;

@interface HRLLocationService()<CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic, strong) CLLocation *oldLocation;

@end


@implementation HRLLocationService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[HRLLocationService alloc] init];
        }
    });
    
    return instance;
}

+ (BOOL)isLocationEnabled
{
    return ([CLLocationManager locationServicesEnabled]
            && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied);
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        if (!self.locationManager)
        {
            self.locationManager = [[CLLocationManager alloc] init];
            
            self.locationManager.distanceFilter = 100;
            self.locationManager.delegate = self;
        }
    }
    
    return self;
}

#pragma mark - private



#pragma mark ______doing

- (void)postNotif4LocationUpdate:(BOOL)success
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [dict setObject:[NSNumber numberWithBool:success]
             forKey:kNotification_LocationService_UpdateKey_Success
       defaultValue:nil];
    [dict setObject:self.oldLocation
             forKey:kNotification_LocationService_UpdateKey_OldLocation
       defaultValue:nil];
    [dict setObject:self.locationManager.location
             forKey:kNotification_LocationService_UpdateKey_NewLocation
       defaultValue:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_LocationService_Update
                                                        object:dict];
}

#pragma mark ______clicked



#pragma mark ______create



#pragma mark ______notif



#pragma mark - DataSource



#pragma mark - Delegates

#pragma mark ______Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *oldLocation = nil;
    CLLocation *newLocation = locations.lastObject;
    
    if (locations.count > 1)
    {
        oldLocation = locations.firstObject;
    }
    
    [self locationManager:manager didUpdateToLocation:newLocation fromLocation:oldLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.oldLocation = oldLocation;
    [self postNotif4LocationUpdate:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self postNotif4LocationUpdate:NO];
}

#pragma mark - public

- (void)startUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
    [self.locationManager startUpdatingLocation];
}

- (CLLocation *)location
{
    return self.locationManager.location;
}


@end
