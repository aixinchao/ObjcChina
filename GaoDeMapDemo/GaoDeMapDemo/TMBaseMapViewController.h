//
//  TMBaseMapViewController.h
//  GaoDeMapDemo
//
//  Created by Taskmall on 15/12/30.
//  Copyright © 2015年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>


@interface TMBaseMapViewController : UIViewController<MAMapViewDelegate,AMapSearchDelegate>

@property (nonatomic,strong) MAMapView * mapView;
@property (nonatomic,strong) AMapSearchAPI * searchAPI;


@end
