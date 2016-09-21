//
//  ViewController.m
//  LogicVCDemo
//
//  Created by Taskmall on 16/8/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "TMLogicPickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"逻辑跳转";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 100.f, 80.f, 40.f);
    button.backgroundColor = [UIColor orangeColor];
    button.layer.cornerRadius = 5.f;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)sender {
    NSMutableArray * dataArray = [NSMutableArray arrayWithObjects:@(1),@(2),@(3), nil];
    TMLogicPickerView * logicPickerView = [[TMLogicPickerView alloc] initWithFrame:self.view.frame with:dataArray];
    [self.navigationController.view addSubview:logicPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
