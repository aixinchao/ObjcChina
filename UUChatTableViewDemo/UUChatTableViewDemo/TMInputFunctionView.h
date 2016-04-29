//
//  TMInputFunctionView.h
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/12.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMInputFunctionView;
@protocol TMInputFunctionViewDelegate <NSObject>

// text
- (void)UUInputFunctionView:(TMInputFunctionView *)funcView sendMessage:(NSString *)message;

// image
- (void)UUInputFunctionView:(TMInputFunctionView *)funcView sendPicture:(UIImage *)image;

@end

@interface TMInputFunctionView : UIView<UITextViewDelegate>

@property (nonatomic, strong) UIButton * btnSendMessage;
@property (nonatomic, strong) UITextView * textViewInput;

@property (nonatomic, unsafe_unretained) BOOL isAbleToSendTextMessage;

@property (nonatomic, strong) UIViewController * superVC;

@property (nonatomic, weak) id<TMInputFunctionViewDelegate> delegate;

- (id)initWithSuperVC:(UIViewController *)superVC;

- (void)changeSendBtnWithPhoto:(BOOL)isPhoto;

@end
