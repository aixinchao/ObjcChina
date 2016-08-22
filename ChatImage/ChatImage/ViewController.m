//
//  ViewController.m
//  ChatImage
//
//  Created by Taskmall on 16/6/7.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"6.6";
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.9"]];
    imageView.frame = CGRectMake(20.f, 80.f, 160.f, 40.f);
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
