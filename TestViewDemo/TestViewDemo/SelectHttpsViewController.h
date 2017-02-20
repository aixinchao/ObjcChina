//
//  SelectHttpsViewController.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/9.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectHttpView;
@interface SelectHttpsViewController : BaseViewController

@property (nonatomic,strong) NSArray * httpArray;
@property (nonatomic,strong) SelectHttpView * mainView;
@property (nonatomic,strong) SelectHttpViewModel * viewModel;

@end
