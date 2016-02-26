//
//  PhotosTableViewController.m
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PhotosTableViewController.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface PhotosTableViewController ()

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView {
    TableViewCellConfigureBlock configureCell = ^(PhotoTableViewCell * cell, Photo * photo) {
        NSLog(@"cell_____%@",cell);
        [cell configureForPhoto:photo];
    };
    NSArray * photos = [AppDelegate sharedDelegate].store.sortedPhotos;
    NSLog(@"%@",photos);
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos cellIdentifier:PhotoCellIdentifier configureCellBlock:configureCell];
    self.tableView.dataSource = self.photosArrayDataSource;
    [self.tableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:PhotoCellIdentifier];
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"123");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
