//
//  PerSideBarViewModel.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseViewModel.h"

typedef void(^perSideBarViewBlock)(NSError * error);
typedef void(^perSideIndexPathBlock)(NSIndexPath * indexPath);
typedef void(^perSideScrollViewBlock)(CGFloat scrollY);

@interface PerSideBarViewModel : BaseViewModel<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) perSideIndexPathBlock perSideIndexPathBlock;
@property (nonatomic,copy) perSideScrollViewBlock perSideScrollViewBlock;

#pragma mark -- Public
- (void)getDataWithPerSideBarViewBlock:(perSideBarViewBlock)perSideBarViewBlock;

@end
