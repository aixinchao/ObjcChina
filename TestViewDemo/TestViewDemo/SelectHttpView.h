//
//  SelectHttpView.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseView.h"

@interface SelectHttpView : BaseView

@property (nonatomic,strong) UITableView * tableView;

- (void)bindTableViewDelegate:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>)dataSource;

- (void)reloadData;

@end
