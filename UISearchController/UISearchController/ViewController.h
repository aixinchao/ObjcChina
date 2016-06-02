//
//  ViewController.h
//  UISearchController
//
//  Created by Taskmall on 16/5/10.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating,UISearchBarDelegate>

@property (nonatomic,strong) UITableView        *tableView;
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) NSMutableArray * searchArray;

@end

