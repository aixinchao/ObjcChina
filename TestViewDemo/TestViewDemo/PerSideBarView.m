//
//  PerSideBarView.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PerSideBarView.h"

@implementation PerSideBarView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
        [self.tableView addSubview:self.zoomImageView];
        [self.zoomImageView addSubview:self.circleView];
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
    [self.zoomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@(-160.f));
        make.left.equalTo(@0.f);
        make.right.equalTo(@(-120.f));
        make.bottom.equalTo(@0.f);
        
        make.width.equalTo(@(kWidth-120.f));
        make.height.equalTo(@(160.f));
    }];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@((kWidth-120.f-60.f)/2));
        make.bottom.equalTo(@(-50.f));
        
        make.width.equalTo(@60.f);
        make.height.equalTo(@60.f);
    }];
    [super updateConstraints];
}

- (void)bindTableViewDelegate:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>)dataSource {
    self.tableView.delegate = delegate;
    self.tableView.dataSource = dataSource;
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (UIButton *)circleView {
    if (!_circleView) {
        _circleView = [[UIButton alloc] initWithFrame:CGRectZero];
        _circleView.layer.cornerRadius = 30.f;
        [_circleView setBackgroundImage:[UIImage imageNamed:@"180*180"] forState:UIControlStateNormal];
        _circleView.layer.borderColor = kBarColor.CGColor;
        _circleView.layer.borderWidth = 1.f;
        _circleView.layer.masksToBounds = YES;
        _circleView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    }
    return _circleView;
}

- (UIImageView *)zoomImageView {
    if (!_zoomImageView) {
        _zoomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"catBG"]];
        _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
        _zoomImageView.layer.masksToBounds = YES;
        _zoomImageView.userInteractionEnabled = YES;
        _zoomImageView.autoresizesSubviews = YES;
    }
    return _zoomImageView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(160.f, 0.f, 0.f, 0.f);
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

@end
