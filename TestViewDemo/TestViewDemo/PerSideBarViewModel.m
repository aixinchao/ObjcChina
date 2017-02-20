//
//  PerSideBarViewModel.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PerSideBarViewModel.h"

@implementation PerSideBarViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray new];
    }
    return self;
}

#pragma mark -- Public
- (void)getDataWithPerSideBarViewBlock:(perSideBarViewBlock)perSideBarViewBlock {
    self.dataArray = [NSMutableArray arrayWithObjects:@"个人中心",@"个人设置",@"密码修改",@"我的订单",@"用户帮助",@"关于我们",@"才能测试",@"立即登录", nil];
    if (perSideBarViewBlock) {
        perSideBarViewBlock(nil);
    }
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y < -160) {
        if (self.perSideScrollViewBlock) {
            self.perSideScrollViewBlock(y);
        }
//        CGRect frame = self.zoomImageView.frame;
//        frame.origin.y = y;
//        frame.size.height = -y;
//        self.zoomImageView.frame = frame;
    }
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.perSideIndexPathBlock(indexPath);
}

@end
