//
//  SelectHttpView.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "SelectHttpView.h"

@implementation SelectHttpView

#pragma mark -- LifeCycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

#pragma mark -- 更新约束，自定义view应该重写此方法在其中建立constraints. 注意：要在实现在最后调用[super updateConstraints]  updateConstraints主要功能是更新view的约束,并会调用其所有子视图的该方法去更新约束
- (void)updateConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [super updateConstraints];
}

#pragma mark -- Public
- (void)bindTableViewDelegate:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>)dataSource {
    self.tableView.delegate = delegate;
    self.tableView.dataSource = dataSource;
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark -- Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

@end
