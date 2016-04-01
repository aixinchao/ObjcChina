//
//  TMDatePickerView.m
//  TMDataPicker
//
//  Created by Taskmall on 16/3/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMDatePickerView.h"

#define kWidth   [[UIScreen mainScreen] bounds].size.width
#define kHeight  [[UIScreen mainScreen] bounds].size.height

@implementation TMDatePickerView

- (id)initWithFrame:(CGRect)frame with:(NSString *)dateString {
    self = [super initWithFrame:frame];
    
    if (self) {
        //初始化数据
        self.yearArray = [NSMutableArray arrayWithCapacity:0];
        self.monthArray = [NSMutableArray arrayWithCapacity:0];
        self.dayArray = [NSMutableArray arrayWithCapacity:0];
        self.hourArray = [NSMutableArray arrayWithCapacity:0];
        self.minuteArray = [NSMutableArray arrayWithCapacity:0];
        self.dateString = dateString;
        
        [self getDateDateSource];
        
        UIView * view = [[UIView alloc] initWithFrame:frame];
        view.alpha = 0.4;
        view.backgroundColor = [UIColor blackColor];
        [self addSubview:view];
        
        self.backView = [[UIView alloc] init];
        self.backView.backgroundColor = [UIColor colorWithRed:200.f/255.0 green:200.f/255.0 blue:200.f/255.0 alpha:1];
        self.backView.frame = CGRectMake(0.f, kHeight, kWidth, 220.f);
        [self addSubview:self.backView];
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.f, 40.f, kWidth, 180.f)];
        self.pickerView.showsSelectionIndicator = YES;
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self.backView addSubview:self.pickerView];
        
        [self setDefaultTime];
        
        for (int i = 0; i<2; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = 1000+i;
            button.frame = (i==0)?CGRectMake(10.f, 10.f, 60.f, 35.f):CGRectMake(kWidth-70.f, 10.f, 60.f, 35.f);
            button.titleLabel.font = [UIFont systemFontOfSize:15.f];
            button.layer.cornerRadius = 5.f;
            button.layer.borderColor = [UIColor colorWithRed:180.f/255.0 green:180.f/255.0 blue:180.f/255.0 alpha:1].CGColor;
            button.layer.borderWidth = 1.f;
            [button setTitle:(i==0)?@"取消":@"完成" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:93.f/255.0 green:93.f/255.0 blue:93.f/255.0 alpha:1] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.backView addSubview:button];
        }
    }
    
    return self;
}

- (void)setDefaultTime {
    
    NSTimeInterval threeDay = 3 * 24 * 60 * 60;
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss SSS";
    NSDate * date = [NSDate date];
    NSString * string = [dateFormatter stringFromDate:date];
    NSLog(@"________%@",string);
    
    NSDate * threeDate = [date dateByAddingTimeInterval:threeDay];
    NSString * threeString = [dateFormatter stringFromDate:threeDate];
    NSLog(@"____________%@",threeString);
    
    if (self.dateString) {
        string = self.dateString;
    }
    NSString * year = [string substringWithRange:NSMakeRange(0, 4)];
    NSString * money = [string substringWithRange:NSMakeRange(5, 2)];
    NSString * day = [string substringWithRange:NSMakeRange(8, 2)];
    NSString * hour = [string substringWithRange:NSMakeRange(11, 2)];
    NSString * minute = [string substringWithRange:NSMakeRange(14, 2)];
    NSLog(@"___%@___%@___%@___%@___%@",year,money,day,hour,minute);
    
    [self.pickerView selectRow:([year integerValue]-1990) inComponent:0 animated:NO];
    [self.pickerView selectRow:([money integerValue]-1) inComponent:1 animated:NO];
    [self.pickerView selectRow:([day integerValue]-1) inComponent:2 animated:NO];
    [self.pickerView selectRow:([hour integerValue]-1) inComponent:3 animated:NO];
    [self.pickerView selectRow:[minute integerValue] inComponent:4 animated:NO];
    
}

- (void)getDateDateSource {
    for (int i = 1990; i <= 2050; i++) {
        [self.yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 1; i < 13; i++) {
        [self.monthArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
    for (int i = 1; i < 32; i++) {
        [self.dayArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
    for (int i = 1; i < 25; i++) {
        [self.hourArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
    for (int i = 0; i < 60; i++) {
        [self.minuteArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
}

- (void)buttonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(datePickerView:withDate:)]) {
        if (sender.tag == 1000) {
            [self.delegate datePickerView:self withDate:nil];
        } else {
            NSString * yearString = [self.yearArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
            NSString * monthString = [self.monthArray objectAtIndex:[self.pickerView selectedRowInComponent:1]];
            NSString * dayString = [self.dayArray objectAtIndex:[self.pickerView selectedRowInComponent:2]];
            NSString * hourString = [self.hourArray objectAtIndex:[self.pickerView selectedRowInComponent:3]];
            NSString * minuteString = [self.minuteArray objectAtIndex:[self.pickerView selectedRowInComponent:4]];
            [self.delegate datePickerView:self withDate:[NSString stringWithFormat:@"%@-%@-%@ %@:%@:00 000",yearString,monthString,dayString,hourString,minuteString]];
            
        }
    }
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.yearArray.count;
    } else if (component == 1) {
        return self.monthArray.count;
    } else if (component == 2) {
        NSString * yearString = [self.yearArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
        NSString * monthString = [self.monthArray objectAtIndex:[self.pickerView selectedRowInComponent:1]];
        if ([monthString isEqualToString:@"02"]) {
            if ((([yearString integerValue]%4 == 0 && [yearString integerValue]%100 !=0) || [yearString integerValue]%400==0)) {
                return self.dayArray.count-2;
            } else {
                return self.dayArray.count-3;
            }
        } else if ([monthString isEqualToString:@"01"] || [monthString isEqualToString:@"03"] || [monthString isEqualToString:@"05"] || [monthString isEqualToString:@"07"] || [monthString isEqualToString:@"08"] || [monthString isEqualToString:@"10"] || [monthString isEqualToString:@"12"]) {
            return self.dayArray.count;
        } else {
            return self.dayArray.count-1;
        }
    } else if (component == 3) {
        return self.hourArray.count;
    } else {
        return self.minuteArray.count;
    }
}

#pragma mark -- UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return (kWidth-20.f)/5;
}

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
    
    if (component == 0) {
        pickerLabel.text = [self.yearArray objectAtIndex:row];
    } else if (component == 1) {
        pickerLabel.text = [self.monthArray objectAtIndex:row];
    } else if (component == 2) {
        pickerLabel.text = [self.dayArray objectAtIndex:row];
    } else if (component == 3) {
        pickerLabel.text = [self.hourArray objectAtIndex:row];
    } else {
        pickerLabel.text = [self.minuteArray objectAtIndex:row];
    }
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0 || component == 1) {
        [self.pickerView reloadComponent:2];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
