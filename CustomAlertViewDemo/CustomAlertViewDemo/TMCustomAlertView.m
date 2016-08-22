//
//  TMCustomAlertView.m
//  CustomAlertViewDemo
//
//  Created by Taskmall on 16/4/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMCustomAlertView.h"

@implementation TMCustomAlertView

- (void)dealloc {
    NSLog(@"123");
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView * bgView = [[UIView alloc] init];
        bgView.layer.borderColor = [UIColor orangeColor].CGColor;
        bgView.layer.borderWidth = 1.2;
        bgView.layer.cornerRadius = 5.f;
        bgView.clipsToBounds = YES;
        bgView.bounds = CGRectMake(0.f, 0.f, 275.f, 265.f);
        bgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:bgView];
        
        UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(bgView.frame.size.width-35.f, 5, 30.f, 30.f);
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"gb1080"] forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:cancelButton];
        
        UIImageView * headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Q3"]];
        headImage.bounds = CGRectMake(0.f, 0.f, 80.f, 80.f);
        headImage.center = CGPointMake(bgView.frame.size.width/2, 65.f);
        headImage.layer.cornerRadius = 40.f;
        [bgView addSubview:headImage];
        
        UILabel * nickNameLab = [[UILabel alloc] init];
        nickNameLab.text = @"昵 称";
        nickNameLab.lineBreakMode = NSLineBreakByTruncatingMiddle;
        nickNameLab.textAlignment = NSTextAlignmentCenter;
        nickNameLab.bounds = CGRectMake(0.f, 0.f, 100.f, 30.f);
        nickNameLab.center = CGPointMake(headImage.center.x, 120.f);
        [bgView addSubview:nickNameLab];
        
        UILabel * timeLabel = [[UILabel alloc] init];
        timeLabel.text = @"2016/4/5";
        timeLabel.font = [UIFont systemFontOfSize:13.f];
        timeLabel.textColor = [UIColor grayColor];
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.frame = CGRectMake(bgView.frame.size.width-95.f, 105.f, 70.f, 30.f);
        [bgView addSubview:timeLabel];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(20.f, 135.f, bgView.frame.size.width-40.f, 1);
        lineView.alpha = 0.4;
        lineView.backgroundColor = [UIColor grayColor];
        [bgView addSubview:lineView];
        
        UILabel * contentLab = [[UILabel alloc] init];
        contentLab.text = @"您的任务已确认，报酬会在三日内到账；您的任务已确认，报酬会在三日到账";
        contentLab.font = [UIFont systemFontOfSize:15.f];
        contentLab.numberOfLines = 3;
        contentLab.textColor = [UIColor grayColor];
        contentLab.frame = CGRectMake(20.f, 140.f, bgView.frame.size.width-40.f, 80.f);
        [bgView addSubview:contentLab];
        
        if (!bgView) {
            UIButton * lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
            lookButton.tag = 1000;
            lookButton.frame = CGRectMake(0.f, bgView.frame.size.height-45.f, bgView.frame.size.width/2-0.5, 45.f);
            lookButton.backgroundColor = [UIColor orangeColor];
            lookButton.titleLabel.font = [UIFont systemFontOfSize:20.f];
            [lookButton setTitle:@"查   看" forState:UIControlStateNormal];
            [lookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [lookButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:lookButton];
            
            UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            deterButton.tag = 1001;
            deterButton.frame = CGRectMake(bgView.frame.size.width/2+0.5, bgView.frame.size.height-45.f, bgView.frame.size.width/2-0.5, 45.f);
            deterButton.backgroundColor = [UIColor orangeColor];
            deterButton.titleLabel.font = [UIFont systemFontOfSize:20.f];
            [deterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [deterButton setTitle:@"确   定" forState:UIControlStateNormal];
            [deterButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:deterButton];
        } else {
            UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            deterButton.tag = 1001;
            deterButton.frame = CGRectMake(0.f, bgView.frame.size.height-45.f, bgView.frame.size.width, 45.f);
            deterButton.backgroundColor = [UIColor orangeColor];
            deterButton.titleLabel.font = [UIFont systemFontOfSize:20.f];
            [deterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [deterButton setTitle:@"确   定" forState:UIControlStateNormal];
            [deterButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:deterButton];
        }
    }
    
    return self;
}

- (void)buttonWithClick:(UIButton *)sender {
    if ((sender.tag == 1000) && self.delegate && [self.delegate respondsToSelector:@selector(customAlertView:withTag:)]) {
        [self.delegate customAlertView:self withTag:sender.tag];
    } else {
        [self cancelButtonClick:sender];
    }
}

- (void)cancelButtonClick:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
