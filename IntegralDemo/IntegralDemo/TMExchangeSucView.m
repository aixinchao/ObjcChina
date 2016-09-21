//
//  TMExchangeSucView.m
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMExchangeSucView.h"

@implementation TMExchangeSucView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        
        UIView * bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 10.f;
        bgView.clipsToBounds = YES;
        bgView.bounds = CGRectMake(0.f, 0.f, 375.f-40.f, 300.f);
        bgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:bgView];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 8.f, bgView.frame.size.width, 50.f)];
        titleLabel.text = @"兑换成功";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:18.f];
        [bgView addSubview:titleLabel];
        
        UIView * lineHView = [[UIView alloc] initWithFrame:CGRectMake(20.f, 58.f, bgView.frame.size.width-40.f, 1.f)];
        lineHView.alpha = 0.4;
        lineHView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        [bgView addSubview:lineHView];
        
        UIImageView * headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"relname"]];
        headImage.frame = CGRectMake((bgView.frame.size.width-60.f)/2, 80.f, 51.f, 60.f);
        headImage.clipsToBounds = YES;
        [bgView addSubview:headImage];
        
        UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 160.f, bgView.frame.size.width-40.f, 60.f)];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.numberOfLines = 2;
        contentLabel.textColor = [UIColor grayColor];
        contentLabel.text = @"什么什么卡卷标题\n卡号：1234567890";
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:contentLabel.text];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10.f;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, contentLabel.text.length)];
        contentLabel.attributedText = attributedString;
        [bgView addSubview:contentLabel];
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0.f, bgView.frame.size.height-60.f, bgView.frame.size.width, 1.f)];
        lineView.alpha = 0.4;
        lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        [bgView addSubview:lineView];
        
        UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        deterButton.tag = 1001;
        deterButton.frame = CGRectMake(0.f, bgView.frame.size.height-60.f, bgView.frame.size.width, 60.f);
        deterButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [deterButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [deterButton setTitle:@"确 定" forState:UIControlStateNormal];
        [deterButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:deterButton];
    }
    
    return self;
}

#pragma mark -- 确定按钮
- (void)buttonWithClick:(UIButton *)sender {
    [self endEditing:YES];
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
