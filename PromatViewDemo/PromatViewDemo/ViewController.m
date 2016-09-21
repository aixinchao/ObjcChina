//
//  ViewController.m
//  PromatViewDemo
//
//  Created by Taskmall on 16/9/2.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

extern NSMutableArray * dataArray;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.window = [[[UIApplication sharedApplication] delegate] window];
    self.isShowCustom = YES;
    
    [dataArray addObject:@"能年玲奈"];
    [dataArray addObject:@"桥本爱"];
    [dataArray addObject:@"小鸟游六花"];
    [dataArray addObject:@"平泽唯"];
    [dataArray addObject:@"平泽忧"];
    [dataArray addObject:@"秋山澪"];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 200.f, 100.f, 45.f);
    button.backgroundColor = [UIColor orangeColor];
    button.layer.cornerRadius = 5.f;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)sender {
    [self customAlertViewShowWithTitle:[dataArray firstObject]];
}

- (void)customAlertViewShowWithTitle:(NSString *)title {
    if (!self.isShowCustom) {
        return;
    }
    self.isShowCustom = NO;
    UIView * backView = [[UIView alloc] init];
    backView.alpha = 0.65;
    backView.layer.cornerRadius = 5.f;
    backView.backgroundColor = [UIColor blackColor];
    [self.window addSubview:backView];
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:15.f];
    titleLabel.text = title;
    CGSize size = [titleLabel.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-100.f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil].size;
    [backView addSubview:titleLabel];
    titleLabel.frame = CGRectMake(20.f, 5.f, size.width+20.f, size.height+10);
    backView.center = CGPointMake(self.window.center.x, self.view.frame.size.height+size.height);
    backView.bounds = CGRectMake(0.f, 0.f, size.width+60.f, size.height+20.f);
    [UIView animateWithDuration:0.25 animations:^{
        backView.center = CGPointMake(self.window.center.x, self.view.frame.size.height-145.f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.05 animations:^{
            backView.center = CGPointMake(self.window.center.x, self.view.frame.size.height-130.f);
        }];
    }];
    
    [self performSelector:@selector(customalertViewRemoveFromSuperView:) withObject:backView afterDelay:2.f];
}

- (void)customalertViewRemoveFromSuperView:(UIView *)backView {
    [UIView animateWithDuration:0.1 animations:^{
        backView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [backView removeFromSuperview];
        self.isShowCustom = YES;
        [dataArray removeObjectAtIndex:0];
        if (dataArray.count > 0) {
            [self customAlertViewShowWithTitle:[dataArray firstObject]];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
