//
//  ViewController.h
//  WoDeTianDemo
//
//  Created by Taskmall on 16/9/9.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * listTableView;
@property (nonatomic,strong) UIBarButtonItem * barButton;

@end

