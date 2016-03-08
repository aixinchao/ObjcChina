//
//  TMMapViewController.h
//  GaoDeMapDemo
//
//  Created by Taskmall on 15/12/30.
//  Copyright © 2015年 Taskmall. All rights reserved.
//

#import "TMBaseMapViewController.h"

@interface TMMapViewController : TMBaseMapViewController<UIGestureRecognizerDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) MAPointAnnotation * pointAnnotation;
@property (nonatomic,strong) CLLocation * mapLocation;
@property (nonatomic,strong) CLLocation * mapOldLocation;

@property (nonatomic,strong) UISearchBar * searchBar;
@property (nonatomic,strong) UISearchDisplayController * displayController;
@property (nonatomic,strong) NSMutableArray * tipsArray;


@end
