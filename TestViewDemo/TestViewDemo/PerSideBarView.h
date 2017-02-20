//
//  PerSideBarView.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseView.h"

@interface PerSideBarView : BaseView

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIImageView * zoomImageView;//变焦图片做底层
@property (nonatomic,strong) UIButton * circleView;//类似头像的UIImageView
@property (nonatomic,strong) UILabel * nickNameLabel;//昵称lable

- (void)bindTableViewDelegate:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>)dataSource;

- (void)reloadData;

@end
