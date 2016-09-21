//
//  TMLogicPickerView.m
//  LogicVCDemo
//
//  Created by Taskmall on 16/8/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMLogicPickerView.h"

@implementation TMLogicPickerView

- (id)initWithFrame:(CGRect)frame with:(NSMutableArray *)dataArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = dataArray;
        UIView * view = [[UIView alloc] initWithFrame:frame];
        view.alpha = 0.4;
        view.backgroundColor = [UIColor blackColor];
        [self addSubview:view];
//        [UIView animateWithDuration:0.2 animations:^{
//            self.datePickerView.alpha = 1;
//            self.datePickerView.backView.frame = CGRectMake(0.f, kHeight-220.f, kWidth, 220.f);
//        }];
//        [UIView animateWithDuration:0.2 animations:^{
//            self.datePickerView.alpha = 0;
//            self.datePickerView.backView.frame = CGRectMake(0.f, kHeight, kWidth, 220.f);
//        } completion:^(BOOL finished) {
//            [self.datePickerView removeFromSuperview];
//        }];
        self.backView = [[UIView alloc] init];
        self.backView.backgroundColor = [UIColor whiteColor];
        self.backView.frame = CGRectMake(0.f, 675.f-220, 375.f, 220.f);
        [self addSubview:self.backView];
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.f, 30.f, 375.f, 180.f)];
        self.pickerView.showsSelectionIndicator = YES;
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self.backView addSubview:self.pickerView];
        
        for (int i = 0; i<2; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = 1000+i;
            button.backgroundColor = [UIColor colorWithRed:234.f/255.f green:235.f/255.f blue:239.f/255.f alpha:1];
            button.frame = (i==0)?CGRectMake(10.f, 10.f, 60.f, 35.f):CGRectMake(375-70.f, 10.f, 60.f, 35.f);
            button.layer.cornerRadius = 5.f;
            button.layer.borderColor = [UIColor grayColor].CGColor;
            button.layer.borderWidth = 1.f;
            button.titleLabel.font = [UIFont systemFontOfSize:15.f];
            [button setTitle:(i==0)?@"取消":@"确定" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:85.f/255.0 green:86.f/255.0 blue:88.f/255.0 alpha:1] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.backView addSubview:button];
        }
        
    }
    
    return self;
}

- (void)buttonClick:(UIButton *)sender {
    NSString * string = [self.dataArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
    NSLog(@"%@",string);
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

#pragma mark -- UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40.f;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel * pickerLabel = (UILabel *)view;
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.font = [UIFont systemFontOfSize:15.f];
    }
    
    pickerLabel.text = [NSString stringWithFormat:@"问题%@",[self.dataArray objectAtIndex:row]];
    
    return pickerLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
