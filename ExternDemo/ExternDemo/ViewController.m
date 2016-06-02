//
//  ViewController.m
//  ExternDemo
//
//  Created by Taskmall on 16/5/27.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSString * EXNotification;
Model * model;
NSString * const EXBarNotification = @"555";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"extern";
    
    EXNotification = @"456";
    model.name = @"789";
    
    NSLog(@"=====%@",EXBarNotification);
    
    NSArray * array = @[];
    NSLog(@"%@",[array lastObject]);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 100.f, 60.f, 35.f);
    button.backgroundColor = [UIColor orangeColor];
    button.layer.cornerRadius = 5.f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)sender {
    ExternViewController * externVC = [[ExternViewController alloc] init];
    [self.navigationController pushViewController:externVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
