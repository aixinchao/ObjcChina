//
//  SelectHttpViewModel.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseViewModel.h"
@class UserModel;

typedef void(^selectUserModelBlock)(UserModel * user);
typedef void(^selectHttpViewBlock)(NSError * error);

@interface SelectHttpViewModel : BaseViewModel <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,unsafe_unretained) NSInteger integerRow;
@property (nonatomic,copy) selectUserModelBlock selectBlock;

#pragma mark -- Public
- (void)searchUsersWithSelectHttpViewBlock:(selectHttpViewBlock)selectHttpViewBlock;
- (void)setSelectBlock:(selectUserModelBlock)selectBlock;

@end
