//
//  TMGoodInfoView.m
//  IntegralDemo
//
//  Created by Taskmall on 16/8/31.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMGoodInfoView.h"

@implementation TMGoodInfoView

- (instancetype)initWithFrame:(CGRect)frame dataDict:(NSMutableDictionary *)dataDict {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        
        UIView * bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 10.f;
        bgView.clipsToBounds = YES;
        bgView.bounds = CGRectMake(0.f, 0.f, 375.f-40.f, 400.f);
        bgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:bgView];
        
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor yellowColor];
        imageView.layer.cornerRadius = 5.f;
        imageView.clipsToBounds = YES;
        if ([[dataDict objectForKey:@"image"] isEqualToString:@"image"]) {
            imageView.frame = CGRectMake(20.f, 30.f, bgView.frame.size.width-40.f, 80.f);
        } else {
            imageView.frame = CGRectMake((bgView.frame.size.width-80.f)/2, 30.f, 80.f, 80.f);
        }
        imageView.image = [UIImage imageNamed:@"32"];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [bgView addSubview:imageView];
        
        
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0.f, bgView.frame.size.height-60.f, bgView.frame.size.width, 1.f)];
        lineView.alpha = 0.4;
        lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        [bgView addSubview:lineView];
        
        if ([[dataDict objectForKey:@"key"] isEqualToString:@"key"]) {
            UIButton * lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
            lookButton.tag = 1000;
            lookButton.frame = CGRectMake(0.f, bgView.frame.size.height-55.f, bgView.frame.size.width/2-0.5, 50.f);
            lookButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
            [lookButton setTitle:@"取 消" forState:UIControlStateNormal];
            [lookButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [lookButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:lookButton];
            
            UIView * lineCenterView = [[UIView alloc] initWithFrame:CGRectMake(bgView.frame.size.width/2-0.5, bgView.frame.size.height-60.f, 1.f, 60.f)];
            lineCenterView.alpha = 0.4;
            lineCenterView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
            [bgView addSubview:lineCenterView];
            
            UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            deterButton.tag = 1001;
            deterButton.frame = CGRectMake(bgView.frame.size.width/2+0.5, bgView.frame.size.height-55.f, bgView.frame.size.width/2-0.5, 50.f);
            deterButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
            [deterButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [deterButton setTitle:@"立即兑换" forState:UIControlStateNormal];
            [deterButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:deterButton];
        } else {
            UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            deterButton.tag = 1001;
            deterButton.frame = CGRectMake(0.f, bgView.frame.size.height-55.f, bgView.frame.size.width, 50.f);
            deterButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
            [deterButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [deterButton setTitle:@"确   定" forState:UIControlStateNormal];
            [deterButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:deterButton];
        }
    }
    
    return self;
}

- (void)buttonWithClick:(UIButton *)sender {
    [UIView animateWithDuration:0.25 animations:^{
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
