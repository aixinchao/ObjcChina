//
//  SelectHttpsViewController.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/9.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "SelectHttpsViewController.h"

@interface SelectHttpsViewController ()

@end

@implementation SelectHttpsViewController

- (void)dealloc {
    NSLog(@"%@: dealloc",[SelectHttpsViewController className]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择环境";
    
    self.httpArray = @[@"http://192.168.101.8081",@"http://192.168.101.8090",@"http://192.168.102.8081",@"http://192.168.102.8090"];
    
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    [self.mainView bindTableViewDelegate:self.viewModel dataSource:self.viewModel];
    [self.view addSubview:self.mainView];
    self.mainView.hidden = YES;
    
    [self loadMoreData];
}

- (void)barButtonItemClick:(UIBarButtonItem *)barButton {
    NSUDSetObject([self.viewModel.dataArray objectAtIndex:self.viewModel.integerRow], @"HttpURL");
    NSLog(@"HttpURL: %@  %@",[self.viewModel.dataArray objectAtIndex:self.viewModel.integerRow],NSUDGetObject(@"HttpURL"));
    
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate createTabBarVCWithPerSideBarVC];
}

#pragma mark -- 更新UI界面
- (void)updateViewConstraints {
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

#pragma mark -- 加载请求数据
- (void)loadMoreData {
    [self.viewModel searchUsersWithSelectHttpViewBlock:^(NSError *error) {
        if (!error) {
            [self.mainView reloadData];
            if (self.mainView.hidden) {
                self.mainView.hidden = NO;
            }
        }
    }];
}

#pragma mark -- Getter
- (SelectHttpView *)mainView {
    if (!_mainView) {
        _mainView = [SelectHttpView new];
    }
    return _mainView;
}

- (SelectHttpViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [SelectHttpViewModel new];
    }
    return _viewModel;
}

@end
