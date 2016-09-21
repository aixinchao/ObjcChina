//
//  ViewController.h
//  PromatViewDemo
//
//  Created by Taskmall on 16/9/2.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) UIWindow * window;
@property (nonatomic) BOOL isShowCustom;

@property (nonatomic,strong) NSMutableArray * dataArray;

//下出提示
- (void)customAlertViewShowWithTitle:(NSString *)title;

@end

