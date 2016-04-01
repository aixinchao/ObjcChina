//
//  TMCityPickerView.m
//  TMDataPicker
//
//  Created by Taskmall on 16/3/22.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMCityPickerView.h"

#define kWidth   [[UIScreen mainScreen] bounds].size.width
#define kHeight  [[UIScreen mainScreen] bounds].size.height

@implementation TMCityPickerView

- (id)initWithFrame:(CGRect)frame with:(NSMutableDictionary *)dict {
    self = [super initWithFrame:frame];
    
    if (self) {
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
        
        /*记得初始化数据*/
        NSString * path = [[NSBundle mainBundle] pathForResource:@"City" ofType:@"plist"];
        self.dataArray = [NSArray arrayWithContentsOfFile:path];
        if (dict) {
            for (int i = 0; i<self.dataArray.count; i++) {
                NSString * name = [[self.dataArray objectAtIndex:i] objectForKey:@"name"];
                if ([name isEqualToString:[dict objectForKey:@"province"]]) {
                    self.province = [[self.dataArray objectAtIndex:i] objectForKey:@"name"];
                    self.cityArray = [[self.dataArray objectAtIndex:i] objectForKey:@"children"];
                    [self.pickerView selectRow:i inComponent:0 animated:NO];
                    for (int j = 0; j<self.cityArray.count; j++) {
                        NSString * city = [[self.cityArray objectAtIndex:j] objectForKey:@"name"];
                        if ([city isEqualToString:[dict objectForKey:@"city"]]) {
                            self.city = [dict objectForKey:@"city"];
                            [self.pickerView selectRow:j inComponent:1 animated:NO];
                            break;
                        }
                    }
                }
            }
        } else {
            self.province = [[self.dataArray firstObject] objectForKey:@"name"];
            self.cityArray = [[self.dataArray firstObject] objectForKey:@"children"];
            self.city = [[self.cityArray firstObject] objectForKey:@"name"];
        }
    }
    
    return self;
}

- (void)buttonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cityPickerView:withDate:)]) {
        if (sender.tag == 1000) {
            [self.delegate cityPickerView:self withDate:nil];
        } else {
            NSString * locationID = @" ";
            for (NSMutableDictionary * dict in self.cityArray) {
                if ([[dict objectForKey:@"name"] isEqualToString:self.city]) {
                    locationID = [dict objectForKey:@"id"];
                    break;
                }
            }
            NSMutableDictionary * dataDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.province,@"province",self.city,@"city",locationID,@"locationID", nil];
            [self.delegate cityPickerView:self withDate:dataDict];
        }
    }
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.dataArray.count;
    } else {
        return self.cityArray.count;
    }
}

#pragma mark -- UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return (kWidth-40.f)/2.f-30.f;
    } else {
        return (kWidth-40.f)/2.f+30.f;
    }
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
        pickerLabel.text = [[self.dataArray objectAtIndex:row] objectForKey:@"name"];
    } else {
        pickerLabel.text = [[self.cityArray objectAtIndex:row] objectForKey:@"name"];
    }
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.cityArray = [[self.dataArray objectAtIndex:row] objectForKey:@"children"];
        self.province = [[self.dataArray objectAtIndex:row] objectForKey:@"name"];
        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        self.city = [[self.cityArray firstObject] objectForKey:@"name"];
    } else if (component == 1) {
        self.city = [[self.cityArray objectAtIndex:row] objectForKey:@"name"];
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
