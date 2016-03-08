//
//  ViewController.m
//  GaoDeMapDemo
//
//  Created by Taskmall on 15/12/30.
//  Copyright © 2015年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "TMBaseMapViewController.h"
#import "TMMapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    button.frame = CGRectMake(100.f, 100.f, 100.f, 40.f);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)sender {
    
    TMMapViewController * MapView = [[TMMapViewController alloc] init];
    
    [self.navigationController pushViewController:MapView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
