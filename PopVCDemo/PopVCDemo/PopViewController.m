//
//  PopViewController.m
//  PopVCDemo
//
//  Created by Taskmall on 16/9/26.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80.f, 150.f, 200.f, 200.f);
    button.layer.cornerRadius = 100.f;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:[UIImage imageNamed:@"24"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender {
//    self.preferredContentSize = CGSizeMake(200.f, 200.f);
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
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
