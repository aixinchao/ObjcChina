//
//  BaseTabBarController.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildVCWithClass:Class(HomeViewController) viewTitle:@"塔丝猫" navTitle:@"首页" imageName:@"barImage-1-1"];
    [self addChildVCWithClass:Class(ReleTashViewController) viewTitle:@"发布任务" navTitle:@"发布任务" imageName:@"barImage-2-1"];
    [self addChildVCWithClass:Class(GetTashViewController) viewTitle:@"领取任务" navTitle:@"领取任务" imageName:@"barImage-3-1"];
    [self addChildVCWithClass:Class(PersonalViewController) viewTitle:@"个人中心" navTitle:@"我的" imageName:@"barImage-4-1"];
}

- (void)addChildVCWithClass:(Class)class viewTitle:(NSString *)viewTitle navTitle:(NSString *)navTitle imageName:(NSString *)imageName {
    UIViewController * viewController = [[class alloc] init];
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    viewController.title = viewTitle;
    navigationController.title = navTitle;
    navigationController.tabBarItem.image = [UIImage imageNamed:imageName];
    [self addChildViewController:navigationController];
}

- (UINavigationController *)yq_navigationController {
    return self.selectedViewController;
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
