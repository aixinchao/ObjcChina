//
//  PerSideBarViewController.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PerSideBarViewController.h"

@interface PerSideBarViewController ()

@end

@implementation PerSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mainView bindTableViewDelegate:self.viewModel dataSource:self.viewModel];
    [self.view addSubview:self.mainView];
    self.mainView.hidden = YES;
    
    [self loadMoreData];
    [self setSelectCellBlock];
    [self updatePerSideScrollViewBlock];
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
    [self.viewModel getDataWithPerSideBarViewBlock:^(NSError *error) {
        if (!error) {
            [self.mainView reloadData];
            if (self.mainView.hidden) {
                self.mainView.hidden = NO;
            }
        }
    }];
}

- (void)setSelectCellBlock {
    __weak typeof(self) weakSelf = self;
    [self.viewModel setPerSideIndexPathBlock:^(NSIndexPath *indexPath) {
        if (indexPath) {
            [weakSelf.appDelegate.sideMenuController hideMenu];
        }
    }];
}

- (void)updatePerSideScrollViewBlock {
    __weak typeof(self) weakSelf = self;
    [self.viewModel setPerSideScrollViewBlock:^(CGFloat scrollY) {
        [weakSelf.mainView.zoomImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(scrollY));
            
            make.height.equalTo(@(-scrollY));
        }];
    }];
}

#pragma mark -- Getter
- (PerSideBarView *)mainView {
    if (!_mainView) {
        _mainView = [PerSideBarView new];
    }
    return _mainView;
}

- (PerSideBarViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [PerSideBarViewModel new];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
