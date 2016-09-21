//
//  TMComplaintView.h
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMComplaintView : UIView<UITextViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame type:(NSString *)type;

@property (nonatomic,strong) UITextView * textView;
@property (nonatomic,strong) UIView * bgImageView;
@property (nonatomic,strong) UIView * contentView;
@property (nonatomic,strong) NSString * promatString;

@end
