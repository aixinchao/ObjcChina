//
//  ViewController.m
//  UISearchController
//
//  Created by Taskmall on 16/5/10.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"左对齐";
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    self.searchArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<10; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.searchResultsUpdater = self;//只有一个代理方法,该方法在点击searchBar或者用户改变searchBar的时候会被调用。
    //搜索时背景变暗色
    self.searchController.dimsBackgroundDuringPresentation = NO;
    //搜索时背景变模糊
    self.searchController.obscuresBackgroundDuringPresentation = NO;
    
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 40.f);
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

#pragma mark -- TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.active) {
        return self.searchArray.count;
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第 %@ 行",@(indexPath.row)];
    
    return cell;
}

#pragma mark -- TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -- UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"---6---");
}

#pragma mark -- UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController {
    NSLog(@"---1---");
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    NSLog(@"---2---");
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    NSLog(@"---3---");
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    NSLog(@"---4---");
}

- (void)presentSearchController:(UISearchController *)searchController {
    NSLog(@"---5---");
}

#pragma mark -- UISearchResultsUpdating
//该方法在点击searchBar或者用户改变searchBar的时候会被调用。设置当前对象负责更新数据
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"111111111%@",searchController);
    NSPredicate *  predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",searchController.searchBar.text];
    [self.searchArray removeAllObjects];
    self.searchArray = [NSMutableArray arrayWithArray:[self.dataArray filteredArrayUsingPredicate:predicate]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
