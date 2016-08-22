//
//  ExternViewController.m
//  ExternDemo
//
//  Created by Taskmall on 16/5/27.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ExternViewController.h"

@interface ExternViewController ()

@end

@implementation ExternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //要在这个类使用EXBarNotification 需要创建Header.h文件  在里面声明 extern NSString * const EXBarNotification;
    
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
