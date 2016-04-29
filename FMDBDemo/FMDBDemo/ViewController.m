//
//  ViewController.m
//  FMDBDemo
//
//  Created by Taskmall on 16/4/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "TMFMDBManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"有时候";
    self.view.backgroundColor = [UIColor grayColor];
    [TMFMDBManager shareInstance];
    //http://blog.csdn.net/enuola/article/details/7911181
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
