//
//  TMComplaintView.m
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMComplaintView.h"

@implementation TMComplaintView

- (instancetype)initWithFrame:(CGRect)frame type:(NSString *)type {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick:)];
        [self addGestureRecognizer:tap];
        NSString * titleString;
        if ([type isEqualToString:@"0"]) {
            self.promatString = @"请输入投诉内容，限300字";
            titleString = @"投诉内容";
        } else if ([type isEqualToString:@"1"]) {
            self.promatString = @"请输入补款原因，限300字";
            titleString = @"补款原因";
        } else if ([type isEqualToString:@"2"]) {
            self.promatString = @"请输入退款原因，限300字";
            titleString = @"退款原因";
        }
        UIView * bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 10.f;
        bgView.clipsToBounds = YES;
        bgView.bounds = CGRectMake(0.f, 0.f, 375.f-40.f, 380.f);
        bgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:bgView];
        
        UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.f, 15.f, bgView.frame.size.width-50.f, 30.f)];
        contentLabel.text = titleString;
        contentLabel.font = [UIFont systemFontOfSize:18.f];
        contentLabel.textColor = [UIColor grayColor];
        [bgView addSubview:contentLabel];
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(25.f, 50.f, bgView.frame.size.width-50.f, 140.f)];
        self.textView.delegate = self;
        self.textView.text = self.promatString;
        self.textView.font = [UIFont systemFontOfSize:16.f];
        self.textView.textColor = [UIColor grayColor];
        self.textView.backgroundColor = [UIColor lightGrayColor];
        self.textView.layer.cornerRadius = 5.f;
        [bgView addSubview:self.textView];
        
        UILabel * promatLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.f, 200.f, bgView.frame.size.width-50.f, 30.f)];
        promatLabel.text = @"证据图片";
        promatLabel.textColor = [UIColor grayColor];
        promatLabel.font = [UIFont systemFontOfSize:18.f];
        [bgView addSubview:promatLabel];
        
        self.bgImageView = [[UIView alloc] initWithFrame:CGRectMake(25.f, 235.f, bgView.frame.size.width-50.f, (bgView.frame.size.width-70.f)/5+20.f)];
        self.bgImageView.backgroundColor = [UIColor yellowColor];
        [bgView addSubview:self.bgImageView];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, bgView.frame.size.width-50.f, (bgView.frame.size.width-70.f)/5+20.f)];
        [self.bgImageView addSubview:self.contentView];
        
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
    
    if (self.contentBlock) {
        self.contentBlock(self.textView.text);
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark -- tapGestureClick
- (void)tapGestureClick:(UIGestureRecognizer *)ges {
    [self endEditing:YES];
//    [UIView animateWithDuration:0.25 animations:^{
//        self.alpha = 0;
//    } completion:^(BOOL finished) {
//        [self removeFromSuperview];
//    }];
}

#pragma mark -- UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:self.promatString]) {
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = self.promatString;
        textView.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
    }
}

- (void)dealloc {
    NSLog(@"ComplaintView: dealloc");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
