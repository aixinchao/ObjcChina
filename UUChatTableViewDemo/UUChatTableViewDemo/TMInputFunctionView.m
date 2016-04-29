//
//  TMInputFunctionView.m
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/12.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMInputFunctionView.h"

@implementation TMInputFunctionView

- (id)initWithSuperVC:(UIViewController *)superVC {
    
    self.superVC = superVC;
    CGRect frame = CGRectMake(0.f, Main_Screen_Height-40.f, Main_Screen_Width, 40.f);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        //发送消息
        self.btnSendMessage = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnSendMessage.frame = CGRectMake(Main_Screen_Width-60.f, 5.f, 50.f, 30.f);
        self.btnSendMessage.layer.cornerRadius = 5;
        self.btnSendMessage.backgroundColor = [UIColor orangeColor];
        self.isAbleToSendTextMessage = NO;
        [self.btnSendMessage setTitle:@"发送" forState:UIControlStateNormal];
        self.btnSendMessage.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [self.btnSendMessage addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnSendMessage];
        
        //输入框
        self.textViewInput = [[UITextView alloc] initWithFrame:CGRectMake(10.f, 5.f, Main_Screen_Width-80.f, 30.f)];
        self.textViewInput.layer.cornerRadius = 4.f;
        self.textViewInput.layer.masksToBounds = YES;
        self.textViewInput.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4].CGColor;
        self.textViewInput.layer.borderWidth = 1.f;
        self.textViewInput.delegate = self;
        [self addSubview:self.textViewInput];
        
        self.layer.borderWidth = 1.f;
        self.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.3] CGColor];
    }
    
    return self;
}

- (void)sendMessage:(UIButton *)sender {
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
