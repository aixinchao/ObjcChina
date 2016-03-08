//
//  TMMapViewController.m
//  GaoDeMapDemo
//
//  Created by Taskmall on 15/12/30.
//  Copyright © 2015年 Taskmall. All rights reserved.
//

#import "TMMapViewController.h"

@interface TMMapViewController ()

@end

@implementation TMMapViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.mapView.delegate = self;
//    self.mapView.showsUserLocation = true;
//    self.searchAPI.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tipsArray = [NSMutableArray arrayWithCapacity:0];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 40.f)];
    self.searchBar.barStyle = UIBarStyleDefault;
    self.searchBar.translucent = YES;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索";
    [self.view addSubview:self.searchBar];
    
    self.displayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.displayController.delegate = self;
    self.displayController.searchResultsDataSource = self;
    self.displayController.searchResultsDelegate = self;
    self.displayController.searchContentsController.edgesForExtendedLayout = UIRectEdgeNone;
    
    UITapGestureRecognizer * tapMap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMapGestureRecognizerSelector:)];
    tapMap.delegate = self;
    [self.mapView addGestureRecognizer:tapMap];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tipsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView setContentInset:UIEdgeInsetsZero];
    [tableView setScrollIndicatorInsets:UIEdgeInsetsZero];
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.imageView.image = [UIImage imageNamed:@"locate"];
    }
    
//    cell.textLabel.text = @"能年玲奈";
//    cell.detailTextLabel.text = @"桥本爱";
    AMapTip * tip = [self.tipsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = tip.name;
    cell.detailTextLabel.text = tip.district;
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AMapTip * tip = [self.tipsArray objectAtIndex:indexPath.row];
    if (self.pointAnnotation) {
        [self.mapView removeAnnotation:self.pointAnnotation];
    }
    self.pointAnnotation = [[MAPointAnnotation alloc] init];
    self.pointAnnotation.coordinate = (CLLocationCoordinate2D){tip.location.latitude,tip.location.longitude};
    self.pointAnnotation.title = tip.name;
    self.pointAnnotation.subtitle = tip.district;
    [self.mapView addAnnotation:self.pointAnnotation];
    [self.mapView setCenterCoordinate:self.pointAnnotation.coordinate];
    [self.mapView selectAnnotation:self.pointAnnotation animated:YES];
//    self.mapLocation = [[CLLocation alloc] initWithLatitude:tip.location.latitude longitude:tip.location.longitude];
//    [self mapView:self.mapView regionDidChangeAnimated:YES];
    [self.displayController setActive:NO animated:NO];
    self.searchBar.placeholder = tip.name;
}

#pragma mark -- UISearchDisplayDelegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    [self searchTipsWithKey:searchString];
    return YES;
}

#pragma mark -- 输入提示回调
- (void)onInputTipsSearchDone:(AMapInputTipsSearchRequest *)request response:(AMapInputTipsSearchResponse *)response {
    [self.tipsArray setArray:response.tips];
    
    [self.displayController.searchResultsTableView reloadData];
}

#pragma mark -- Utility
- (void)searchTipsWithKey:(NSString *)key {
    AMapInputTipsSearchRequest * tips = [[AMapInputTipsSearchRequest alloc] init];
    tips.keywords = key;
    [self.searchAPI AMapInputTipsSearch:tips];
}

#pragma mark -- Handle Gesture
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark -- 点击地图将点击的点的坐标转化成经纬度
- (void)tapMapGestureRecognizerSelector:(UIGestureRecognizer *)ges {
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:[ges locationInView:self.mapView] toCoordinateFromView:self.mapView];
    [self searchReGeocodeWithCoordinate:coordinate];
}

#pragma mark -- 发起逆地址编码查询
- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate {
    AMapReGeocodeSearchRequest * regeo = [[AMapReGeocodeSearchRequest alloc] init];
    regeo.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    regeo.requireExtension = true;
    [self.searchAPI AMapReGoecodeSearch:regeo];
}

#pragma mark -- 逆地理编码回调
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response {
    if (response.regeocode != nil) {
        NSLog(@"_____%@_____%@_____%@_____%@_____%@_____%@_____%@_____",response.regeocode.addressComponent.streetNumber.street,response.regeocode.addressComponent.streetNumber.number,response.regeocode.addressComponent.city,response.regeocode.addressComponent.district,response.regeocode.addressComponent.township,response.regeocode.addressComponent.streetNumber.street,response.regeocode.addressComponent.streetNumber.number);
        self.mapLocation = [[CLLocation alloc] initWithLatitude:request.location.latitude longitude:request.location.longitude];
        
        [self mapView:self.mapView regionDidChangeAnimated:YES];
    }
}

#pragma mark -- 将要开始定位
- (void)mapViewWillStartLocatingUser:(MAMapView *)mapView {
    NSLog(@"_____将要开始定位_____");
}

#pragma mark -- 已经停止定位
- (void)mapViewDidStopLocatingUser:(MAMapView *)mapView {
    NSLog(@"_____已经停止定位_____");
}

#pragma mark -- 用户位置发生变化时调用的协议方法
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    NSLog(@"_____用户位置发生变化时调用的协议方法_____%f__________%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//    self.mapLocation = [[CLLocation alloc] initWithLatitude:userLocation.location.coordinate.latitude longitude:userLocation.coordinate.longitude];
}

#pragma mark -- 根据annotation生成对应的view
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    NSLog(@"_____根据annotation生成对应的view_____");
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString * pointResuseIndetifier = @"pointResuseIndetifier";
        MAPinAnnotationView * annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointResuseIndetifier];
        if (annotationView == nil) {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointResuseIndetifier];
        }
        annotationView.canShowCallout = true; //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = false;  //设置标注动画显示，默认为NO
        annotationView.draggable = true;      //设置标注可以拖动，默认为NO
        
        return annotationView;
    }
    
    return nil;
}

#pragma mark -- 当选中一个annotation view时调用此接口
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    NSLog(@"_____当选中一个annotation view时调用此接口_____");
}

#pragma mark -- 地图将要开始移动
- (void)mapView:(MAMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    NSLog(@"_____地图将要开始移动_____");
}

#pragma mark -- 地图移动结束
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"_____地图移动结束_____%f__________%f",self.mapView.userLocation.location.coordinate.latitude,self.mapView.userLocation.location.coordinate.longitude);
    
    if (self.mapLocation == nil) {
        self.mapOldLocation = self.mapLocation;
        self.mapLocation = self.mapView.userLocation.location;
    }
    if (self.mapLocation != self.mapOldLocation) {
        self.mapOldLocation = self.mapLocation;
        CLGeocoder * geocoder = [[CLGeocoder alloc] init];
        
        [geocoder reverseGeocodeLocation:self.mapLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (placemarks.count>0) {
                CLPlacemark * placemark = [placemarks objectAtIndex:0];
                
                if (self.pointAnnotation) {
                    [self.mapView removeAnnotation:self.pointAnnotation];
                }
                self.pointAnnotation = [[MAPointAnnotation alloc] init];
                self.pointAnnotation.coordinate = self.mapLocation.coordinate;
                self.pointAnnotation.title = [NSString stringWithFormat:@"%@%@%@",(placemark.subLocality)?placemark.subLocality:placemark.name,(placemark.thoroughfare)?placemark.thoroughfare:@"",(placemark.subThoroughfare)?placemark.subThoroughfare:@""];
                self.pointAnnotation.subtitle = placemark.name;
                [self.mapView addAnnotation:self.pointAnnotation];
                [self.mapView selectAnnotation:self.pointAnnotation animated:YES];
                NSLog(@"_____%@_____%@_____%@_____%@_____%@_____%@_____%@_____%@_____%@_____%@",placemark.name,placemark.thoroughfare,placemark.subThoroughfare,placemark.locality,placemark.subLocality,placemark.administrativeArea,placemark.subAdministrativeArea,placemark.postalCode,placemark.ISOcountryCode,placemark.country);
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
