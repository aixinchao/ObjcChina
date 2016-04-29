//
//  ViewController.m
//  CustomAlertViewDemo
//
//  Created by Taskmall on 16/4/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "TMCustomAlertView.h"

@interface ViewController ()<TMCustomAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100.f, 100.f, 80.f, 30.f);
    button.layer.cornerRadius = 5.f;
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)sender {
    TMCustomAlertView * customView = [[TMCustomAlertView alloc] initWithFrame:self.view.frame];
    customView.delegate = self;
    [self.view addSubview:customView];
}

- (void)customAlertView:(TMCustomAlertView *)customView withTag:(NSInteger)tag {
    NSLog(@"________%ld",(long)tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
