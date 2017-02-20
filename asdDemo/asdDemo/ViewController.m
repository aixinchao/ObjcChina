//
//  ViewController.m
//  asdDemo
//
//  Created by Taskmall on 16/12/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 64.f, self.view.frame.size.width, 100)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.borderColor = [UIColor grayColor].CGColor;
    self.bgView.layer.borderWidth = 1.f;
    self.bgView.layer.masksToBounds = YES;
    [self.view addSubview:self.bgView];
    self.askTypeView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 64.f, self.view.frame.size.width, 40.f)];
    self.askTypeView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:self.askTypeView];
    self.experienceView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 60.f, self.view.frame.size.width, 40.f)];
    self.experienceView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:self.experienceView];
    UIScrollView * scrollExpView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width-110.f, 40.f)];
    scrollExpView.backgroundColor = [UIColor orangeColor];
    [self.experienceView addSubview:scrollExpView];
    CGFloat width = 50.f;
    scrollExpView.contentSize = CGSizeMake(width*(7+1), 40.f);
    [self.bgView bringSubviewToFront:self.experienceView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
