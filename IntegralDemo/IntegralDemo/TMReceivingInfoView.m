//
//  TMReceivingInfoView.m
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMReceivingInfoView.h"

@implementation TMReceivingInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick:)];
        [self addGestureRecognizer:tap];

        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor whiteColor];
        self.bgView.layer.cornerRadius = 10.f;
        self.bgView.clipsToBounds = YES;
        self.bgView.bounds = CGRectMake(0.f, 0.f, 375.f-40.f, 320.f);
        self.bgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:self.bgView];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 8.f, self.bgView.frame.size.width, 50.f)];
        titleLabel.text = @"收货信息";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:18.f];
        [self.bgView addSubview:titleLabel];
        
        UIView * lineHView = [[UIView alloc] initWithFrame:CGRectMake(20.f, 58.f, self.bgView.frame.size.width-40.f, 1.f)];
        lineHView.alpha = 0.4;
        lineHView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        [self.bgView addSubview:lineHView];
        
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.f, 75.f, 80.f, 35.f)];
        nameLabel.text = @"收  货  人";
        nameLabel.textColor = [UIColor grayColor];
        [self.bgView addSubview:nameLabel];
        
        self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(105.f, 75.f, self.bgView.frame.size.width-50.f-80.f, 35.f)];
        self.nameTextField.delegate = self;
        self.nameTextField.placeholder = @"请输入收货人姓名";
        self.nameTextField.font = [UIFont systemFontOfSize:16.f];
        self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self.bgView addSubview:self.nameTextField];
        
        UILabel * phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.f, 125.f, 80.f, 35.f)];
        phoneLabel.text = @"手手机机";
        phoneLabel.textColor = [UIColor grayColor];
        [self.bgView addSubview:phoneLabel];
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:phoneLabel.text];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(1, 2)];
        phoneLabel.attributedText = attributedString;
        
        self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(105.f, 125.f, self.bgView.frame.size.width-50.f-80.f, 35.f)];
        self.phoneTextField.delegate = self;
        self.phoneTextField.placeholder = @"请输入收货人手机";
        self.phoneTextField.font = [UIFont systemFontOfSize:16.f];
        self.phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self.bgView addSubview:self.phoneTextField];
        
        UILabel * addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.f, 175, 80.f, 35.f)];
        addressLabel.text = @"详细地址";
        addressLabel.textColor = [UIColor grayColor];
        [self.bgView addSubview:addressLabel];
        
        self.addressTextView = [[UITextView alloc] initWithFrame:CGRectMake(105.f, 175.f, self.bgView.frame.size.width-50.f-80.f, 70.f)];
        self.addressTextView.delegate = self;
        self.addressTextView.font = [UIFont systemFontOfSize:16.f];
        self.addressTextView.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        self.addressTextView.layer.cornerRadius = 5.f;
        self.addressTextView.text = @"请输入详细地址";
        self.addressTextView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.4].CGColor;
        self.addressTextView.layer.borderWidth = 0.5;
        [self.bgView addSubview:self.addressTextView];
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0.f, self.bgView.frame.size.height-60.f, self.bgView.frame.size.width, 1.f)];
        lineView.alpha = 0.4;
        lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        [self.bgView addSubview:lineView];
        
        UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        deterButton.tag = 1001;
        deterButton.frame = CGRectMake(0.f, self.bgView.frame.size.height-60.f, self.bgView.frame.size.width, 60.f);
        deterButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [deterButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [deterButton setTitle:@"确 定" forState:UIControlStateNormal];
        [deterButton addTarget:self action:@selector(buttonWithClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:deterButton];
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

#pragma mark -- tapGestureClick
- (void)tapGestureClick:(UIGestureRecognizer *)ges {
    [self endEditing:YES];
}

#pragma mark -- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGRect oldframe = [textField.superview convertRect:textField.frame toView:self];
    CGFloat offSetY = (280.f)-(self.frame.size.height-oldframe.origin.y-35.f);
    if (offSetY > 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.bgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-offSetY);
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    }];
}

#pragma mark -- UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"请输入详细地址"]) {
        textView.text = @"";
    }
    CGRect oldframe = [textView.superview convertRect:textView.frame toView:self];
    CGFloat offSetY = (280.f)-(self.frame.size.height-oldframe.origin.y-70.f);
    if (offSetY > 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.bgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-offSetY);
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"请输入详细地址";
        textView.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
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
