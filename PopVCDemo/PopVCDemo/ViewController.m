//
//  ViewController.m
//  PopVCDemo
//
//  Created by Taskmall on 16/9/26.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "PopViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    NSLog(@"self.navigationController.navigationBar.hidden:%d",self.navigationController.navigationBar.hidden);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"self.navigationController.navigationBar.hidden:%d",self.navigationController.navigationBar.hidden);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"self.navigationController.navigationBar.hidden:%d",self.navigationController.navigationBar.hidden);
}

- (IBAction)buttonClick:(UIButton *)sender {
    PopViewController * popVC = [[PopViewController alloc] init];
    [self presentViewController:popVC animated:YES completion:^{
        
    }];
    NSLog(@"self.navigationController.navigationBar.hidden:%d",self.navigationController.navigationBar.hidden);
//    popVC.preferredContentSize = CGSizeMake(200.f, 200.f);
//    popVC.view.superview.frame = CGRectMake(0.f, 0.f, 200.f, 200.f);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
