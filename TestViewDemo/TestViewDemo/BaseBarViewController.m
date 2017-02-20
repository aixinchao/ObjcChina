//
//  BaseBarViewController.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/19.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseBarViewController.h"

@interface BaseBarViewController ()

@end

@implementation BaseBarViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton * sideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sideButton.exclusiveTouch = YES;
    sideButton.frame = CGRectMake(0.f, 0.f, 20.f, 15.f);
    [sideButton setBackgroundImage:[UIImage imageNamed:@"barTopLeft"] forState:UIControlStateNormal];
    [sideButton addTarget:self action:@selector(sideBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * sideBarBut = [[UIBarButtonItem alloc] initWithCustomView:sideButton];
    self.navigationItem.leftBarButtonItem = sideBarBut;
    
    self.badgeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.badgeButton.exclusiveTouch = YES;
    self.badgeButton.frame = CGRectMake(0.f, 0.f, 26.5, 20.f);
    [self.badgeButton setBackgroundImage:[UIImage imageNamed:@"barTopXin"] forState:UIControlStateNormal];
    [self.badgeButton addTarget:self action:@selector(rightButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    self.rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.badgeButton];
    [self.badgeButton showBadgeOnImageViewIndex:@"52"];
    self.navigationItem.rightBarButtonItem = self.rightButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeRightBarButtonImageTitle:) name:@"changeRightBarButton" object:nil];
    
}

- (void)changeRightBarButtonImageTitle:(NSNotification *)notification {
    if (notification.object) {
        [self.badgeButton showBadgeOnImageViewIndex:@"50"];
        self.rightButtonItem.customView = self.badgeButton;
    } else {
        [self.badgeButton hideBadgeOnImageViewIndex:nil];
    }
}

- (void)sideBarButtonClick:(UIButton *)sender {
    if (self.appDelegate.sideMenuController.menuHidden) {
        [self.appDelegate.sideMenuController showMenu];
    } else {
        [self.appDelegate.sideMenuController hideMenu];
    }
}

- (void)rightButtonItemClick:(UIButton *)sender {
    StandLetterViewController * standLetterVC = [[StandLetterViewController alloc] init];
    standLetterVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:standLetterVC animated:YES];
//    [self.appDelegate.sideMenuController showViewController:standLetterVC];
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
