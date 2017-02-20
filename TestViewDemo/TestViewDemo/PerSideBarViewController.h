//
//  PerSideBarViewController.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseViewController.h"

@class PerSideBarView,PerSideBarViewModel;
@interface PerSideBarViewController : BaseViewController

@property (nonatomic,strong) PerSideBarView * mainView;
@property (nonatomic,strong) PerSideBarViewModel * viewModel;

@end
