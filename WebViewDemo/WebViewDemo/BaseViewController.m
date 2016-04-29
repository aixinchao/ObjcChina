//
//  BaseViewController.m
//  WebViewDemo
//
//  Created by Taskmall on 16/4/29.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    float buttonWidth = 45.f;
    float gatWidth = (self.view.frame.size.width- 20.f * 2 - buttonWidth * 4)/3;
    for (int i = 0; i < 4; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20.f + i * (buttonWidth + gatWidth), 100.f, buttonWidth, buttonWidth);
        button.layer.cornerRadius = buttonWidth/2;
        button.backgroundColor = [UIColor colorWithRed:random()%256/255.f green:random()%256/255.f blue:random()%256/255.f alpha:1];
        [self.view addSubview:button];
    }
    
    for (int i = 0; i < 3; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.bounds = CGRectMake(0.f, 0.f, buttonWidth, buttonWidth);
        button.center = CGPointMake(20.f + (buttonWidth + gatWidth/2) * (i+1) + i * gatWidth/2, 200.f);
        button.layer.cornerRadius = buttonWidth/2;
        button.backgroundColor = [UIColor colorWithRed:random()%256/255.f green:random()%256/255.f blue:random()%256/255.f alpha:1];
        [self.view addSubview:button];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
