//
//  TMReceivingInfoView.h
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMReceivingInfoView : UIView<UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UIView * bgView;
@property (nonatomic,strong) UITextField * nameTextField;
@property (nonatomic,strong) UITextField * phoneTextField;
@property (nonatomic,strong) UITextView * addressTextView;

@end
