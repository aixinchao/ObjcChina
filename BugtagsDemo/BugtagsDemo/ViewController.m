//
//  ViewController.m
//  BugtagsDemo
//
//  Created by Taskmall on 16/11/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 160.f, 80.f, 36.f);
    button.backgroundColor = [UIColor yellowColor];
    button.layer.cornerRadius = 5.f;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender {
    NSArray * dataArray = @[@"1",@"2"];
    NSString * string = [dataArray objectAtIndex:2];
    [sender setTitle:string forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
