//
//  PhotosTableViewController.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArrayDataSource;
@interface PhotosTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) ArrayDataSource * photosArrayDataSource;

@end
