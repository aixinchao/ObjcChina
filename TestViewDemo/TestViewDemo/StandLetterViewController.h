//
//  StandLetterViewController.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/19.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseViewController.h"

@interface StandLetterViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * listTableView;
@property (nonatomic,strong) UIBarButtonItem * barButton;

@end
