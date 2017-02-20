//
//  SelectHttpViewModel.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "SelectHttpViewModel.h"

@implementation SelectHttpViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray new];
    }
    return self;
}

#pragma mark -- Public
- (void)searchUsersWithSelectHttpViewBlock:(selectHttpViewBlock)selectHttpViewBlock {
    self.dataArray = [NSMutableArray arrayWithObjects:@"http://192.168.101.8081",@"http://192.168.101.8090",@"http://192.168.102.8081",@"http://192.168.102.8090", nil];
    if (selectHttpViewBlock) {
        selectHttpViewBlock(nil);
    }
}

- (void)setSelectBlock:(selectUserModelBlock)selectBlock {
    self.selectBlock = selectBlock;
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
    cell.textLabel.font = [UIFont systemFontOfSize:TM18Font];
    NSLog(@"______%f",TM18Font);
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    if (self.integerRow == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.integerRow = indexPath.row;
    [tableView reloadData];
}

@end
