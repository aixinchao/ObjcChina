//
//  ViewController.m
//  CancellationDemo
//
//  Created by Taskmall on 16/8/16.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"我就是我";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 150.f, 100.f, 40.f);
    button.backgroundColor = [UIColor orangeColor];
    button.layer.cornerRadius = 5.f;
    [button setTitle:@"我就是我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender {
    OneViewController * oneVC = [[OneViewController alloc] init];
    [self.navigationController pushViewController:oneVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
