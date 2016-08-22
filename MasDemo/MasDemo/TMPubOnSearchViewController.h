//
//  TMPubOnSearchViewController.h
//  MasDemo
//
//  Created by Taskmall on 16/7/4.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMStepAlertView.h"

@interface TMPubOnSearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * dataTableView;
@property (nonatomic,strong) UIView * headView;
@property (nonatomic,strong) UIButton * waitButtonImage;
@property (nonatomic,strong) UIButton * waitButton;
@property (nonatomic,strong) UIButton * allButtonImage;
@property (nonatomic,strong) UIButton * allButton;
@property (nonatomic,strong) UIButton * lastButton;

@end
