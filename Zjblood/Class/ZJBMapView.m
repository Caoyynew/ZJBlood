//
//  ZJBMapView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/23.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMapView.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define screenW self.frame.size.width
const double a = 6378245.0;
const double ee = 0.00669342162296594323;

@interface ZJBMapView ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    MKMapView * _mapView;
    CLLocationManager * locationManager;
    MKPointAnnotation * pointAnnotation;
    
    CLLocationCoordinate2D coords;
    
    MKLocalSearchRequest * localSearchRequest;

}
@property (nonatomic ,strong) NSMutableArray * searchResultArr;

@end
@implementation ZJBMapView

-(NSMutableArray *)searchResultArr
{
    if (!_searchResultArr) {
        _searchResultArr = [[NSMutableArray alloc]init];
    }
    return _searchResultArr;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        [self locationMySelf];
    }
    return self;
}
#pragma mark - 创建UI
-(void)createUI
{
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, screenW, 230)];
    _mapView.delegate = self;
    //创建大头针
    pointAnnotation = [[MKPointAnnotation alloc] init];
    //设置主标题
    pointAnnotation.title =@"我在这里";
    //设置副标题
    //将大头针添加到地图上
    [_mapView addAnnotation:pointAnnotation];
    [self addSubview:_mapView];
}
#pragma mark - 定位自己
-(void)locationMySelf
{
    locationManager =[[CLLocationManager alloc] init];
    //设置定位属性
    locationManager.desiredAccuracy =kCLLocationAccuracyBest;
    //设置定位更新距离militer
    locationManager.distanceFilter=10.0;
    //绑定定位委托
    locationManager.delegate=self;
    /**设置用户请求服务*/
    //1.去info.plist文件添加定位服务描述,设置的内容可以在显示在定位服务弹出的提示框
    //取出当前应用的定位服务状态(枚举值)
    CLAuthorizationStatus status =[CLLocationManager authorizationStatus];
    //如果未授权则请求
    if(status==kCLAuthorizationStatusNotDetermined) {
        
        [locationManager requestAlwaysAuthorization];
    }
    //开始定位
    [locationManager startUpdatingLocation];
}
#pragma mark CLLocationManagerDelegate

//定位后的返回结果
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    //先停止定位
    [locationManager stopUpdatingLocation];
    //遍历数组取出坐标--》如果不需要也可以不遍历
    CLLocation *location =[locations firstObject];
    //火星坐标转地球坐标
    CLLocationCoordinate2D loc = [self locationMarsFromEarth:location.coordinate];
    //设置地图显示该经纬度的位置
    MKCoordinateRegion region =MKCoordinateRegionMake(loc, MKCoordinateSpanMake(0.005,0.005));
    [_mapView setRegion:region animated:YES];
    
    //设置大头针经纬度
    pointAnnotation.coordinate = loc;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *array, NSError *error)
     {
         CLGeocoder *geocoder = [[CLGeocoder alloc] init];
         [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *array, NSError *error) {
             if (array.count > 0)
             {
                 CLPlacemark *placemark = [array objectAtIndex:0];
                 NSString *city = placemark.administrativeArea;
                 if (!city) {
                     // 四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                     city = placemark.administrativeArea;
                 }
                 NSLog(@"当前城市:%@",city);
                 //查询附近的献血中心
                 [self issueLocalSearchLookup:@"献血" usingPlacemarksArray:array[0]];
             }
             else if (error == nil && [array count] == 0)
             {
                 NSLog(@"No results were returned.");
             }
             else if (error != nil)
             {
                 NSLog(@"An error occurred = %@", error);
             }
         }];
     }];
}
-(void)issueLocalSearchLookup:(NSString *)searchString usingPlacemarksArray:(CLPlacemark *)placemarks {
    
    // Search km from point for stores.
    
    CLPlacemark *placemark = placemarks;
    CLLocation *location = placemark.location;
    coords = location.coordinate;
    // Set the size (local/span) of the region (address, w/e) we want to get search results for.
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, span);
    localSearchRequest = [[MKLocalSearchRequest alloc] init];
    localSearchRequest.region = region;
    localSearchRequest.naturalLanguageQuery = searchString;
    // Perform the search request...
    MKLocalSearch * localSearch = [[MKLocalSearch alloc] initWithRequest:localSearchRequest];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        if(error){
            NSLog(@"查询无结果");
            return;
        } else {
            NSMutableArray *listAry = [[NSMutableArray alloc]init];
            for(MKMapItem *mapItem in response.mapItems){
                // Show pins, pix, w/e...
                                NSLog(@"Name for result: = %@", mapItem.phoneNumber);
                NSString *name = mapItem.name;
                [listAry addObject:name];
            }
            for (NSString *str in listAry) {
                if (![self.searchResultArr containsObject:str]) {
                    [self.searchResultArr addObject:str];
                }
            }
            NSLog(@"searchArr = %@",_searchResultArr);
        }
    }];
}
#pragma mark - 火星坐标转中国地图坐标
-(CLLocationCoordinate2D)locationMarsFromEarth:(CLLocationCoordinate2D)latLng
{
    double wgLat = latLng.latitude;
    double wgLon = latLng.longitude;
    double mgLat;
    double mgLon;
    
    if ([self outOfChina:wgLat :wgLon ])
    {
        return latLng;
    }
    double dLat = [self transformLat:wgLon-105.0 :wgLat - 35 ];
    double dLon = [self transformLon:wgLon-105.0 :wgLat - 35 ];
    
    double radLat = wgLat / 180.0 * M_PI;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    mgLat = wgLat + dLat;
    mgLon = wgLon + dLon;
    CLLocationCoordinate2D loc2D ;
    loc2D.latitude = mgLat;
    loc2D.longitude = mgLon;
    
    return loc2D;
}
#pragma mark private
- (BOOL) outOfChina:(double) lat :(double) lon
{
    if (lon < 72.004 || lon > 137.8347) {
        return true;
    }
    if (lat < 0.8293 || lat > 55.8271) {
        return true;
    }
    return false;
}
- (double) transformLat:(double)x  :(double) y
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y +
    0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 *sin(2.0 * x *M_PI)) * 2.0 /
    3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 *sin(y / 3.0 *M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 *sin(y * M_PI / 30.0)) * 2.0 /
    3.0;
    return ret;
}
- (double) transformLon:(double) x :(double) y
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 /
    3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 *M_PI) + 300.0 *sin(x / 30.0 * M_PI)) * 2.0 /
    3.0;
    return ret;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
