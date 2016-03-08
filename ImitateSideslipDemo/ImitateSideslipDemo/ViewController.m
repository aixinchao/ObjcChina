//
//  ViewController.m
//  ImitateSideslipDemo
//
//  Created by Taskmall on 16/3/7.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];
    
    self.homeVC = [[HomeViewController alloc] init];
    [self.view addSubview:self.homeVC.view];
    
    UIPanGestureRecognizer * pangesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerSelector:)];
    [self.homeVC.view addGestureRecognizer:pangesture];
    
}

- (void)panGestureRecognizerSelector:(UIPanGestureRecognizer *)panGesture {
    NSLog(@"%@",panGesture.view);
    CGPoint translation = [panGesture translationInView:self.view];
    //实时距离
    float trueDistance = self.distance + translation.x;
    NSLog(@"___________%f",trueDistance);
    //如果UIPanGestureRecognizer结束,则激活自动停靠
//    else if (trueDistance < ScreenWidth*(-1/3.0)) {
//        [self showRight];
//    }
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        if (trueDistance > ScreenWidth*(1/3.0)) {
            [self showLeft];
        } else {
            [self showHome];
        }
        
        return;
    }
    
//    float proprotion = (panGesture.view.frame.origin.x >= 0)?-1:1;
//    proprotion *= trueDistance/ScreenWidth;
//    proprotion *= 1-0.77;
//    proprotion /= 0.6;
//    proprotion += 1;
//    if (proprotion <= 0.77) {
//        return;
//    }
    
    if (panGesture.view.frame.origin.x>ScreenWidth*2/3.0 || (translation.x<0 && panGesture.view.frame.origin.x==0) || panGesture.view.frame.origin.x < 0) {
        return;
    }
    
    panGesture.view.center = CGPointMake(self.view.center.x + trueDistance, self.view.center.y);
//    panGesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
}

//展示左视图
- (void)showLeft {
    self.distance = ScreenWidth*2/3.0;
    [self doTheAnimate:1];
}

//展示主视图
- (void)showHome {
    self.distance = 0;
    [self doTheAnimate:1];
}

//展示右视图
- (void)showRight {
    self.distance = -ScreenWidth*2/3.0;
    [self doTheAnimate:1];
}

//执行三种视图展示
- (void)doTheAnimate:(CGFloat)proportion {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.homeVC.view.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
//        self.homeVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
