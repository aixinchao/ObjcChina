//
//  TMBaseMapViewController.m
//  GaoDeMapDemo
//
//  Created by Taskmall on 15/12/30.
//  Copyright © 2015年 Taskmall. All rights reserved.
//

#import "TMBaseMapViewController.h"

@interface TMBaseMapViewController ()

@end

@implementation TMBaseMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0.f, 44.f, self.view.frame.size.width, self.view.frame.size.height-44.f)];
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = true;
    self.mapView.zoomLevel = 12.f;
    [self.view addSubview:self.mapView];
    
    [AMapSearchServices sharedServices].apiKey = @"82766006ab725d440b9c58ed3c66df5b";
    self.searchAPI = [[AMapSearchAPI alloc] init];
    self.searchAPI.delegate = self;
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
