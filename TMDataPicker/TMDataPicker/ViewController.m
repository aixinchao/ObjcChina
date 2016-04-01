//
//  ViewController.m
//  TMDataPicker
//
//  Created by Taskmall on 16/3/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 100.f, 80.f, 35.f);
    button.backgroundColor = [UIColor orangeColor];
    button.layer.cornerRadius = 5;
    [button setTitle:@"选择时间" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cityButton.frame = CGRectMake(210.f, 100.f, 80.f, 35.f);
    cityButton.backgroundColor = [UIColor orangeColor];
    cityButton.layer.cornerRadius = 5.f;
    [cityButton setTitle:@"选择城市" forState:UIControlStateNormal];
    [cityButton addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cityButton];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 150.f, self.view.frame.size.width-40.f, 35.f)];
    self.dateLabel.backgroundColor = [UIColor orangeColor];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.dateLabel];
    
    self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 200.f, self.view.frame.size.width-40.f, 35.f)];
    self.cityLabel.backgroundColor = [UIColor orangeColor];
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.cityLabel];
    
}

- (void)cityButtonClick:(UIButton *)sender {
    self.cityPickerView = [[TMCityPickerView alloc] initWithFrame:self.view.frame with:self.locationDict];
    self.cityPickerView.delegate = self;
    self.cityPickerView.alpha = 0;
    [self.navigationController.view addSubview:self.cityPickerView];
    [UIView animateWithDuration:0.2 animations:^{
        self.cityPickerView.alpha = 1;
        self.cityPickerView.backView.frame = CGRectMake(0.f, self.view.frame.size.height-220.f, self.view.frame.size.width, 220.f);
    }];
}

- (void)cityPickerView:(TMCityPickerView *)cityPicker withDate:(NSMutableDictionary *)dataDict {
    [UIView animateWithDuration:0.2 animations:^{
        self.cityPickerView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.cityPickerView removeFromSuperview];
        self.cityPickerView.backView.frame = CGRectMake(0.f, self.view.frame.size.height, self.view.frame.size.width, 220.f);
    }];
    if (dataDict) {
        self.locationDict = dataDict;
        
        if ([[dataDict objectForKey:@"province"] isEqualToString:[dataDict objectForKey:@"city"]]) {
            self.cityLabel.text = [NSString stringWithFormat:@"%@",[dataDict objectForKey:@"city"]];
        } else {
            self.cityLabel.text = [NSString stringWithFormat:@"%@%@",[dataDict objectForKey:@"province"],[dataDict objectForKey:@"city"]];
        }
    }
}

- (void)buttonClick:(UIButton *)sender {
    [self getDateTimeWith];
}

- (void)getDateTimeWith {
    self.datePickerView = [[TMDatePickerView alloc] initWithFrame:self.view.frame with:self.dateLabel.text];
    self.datePickerView.delegate = self;
    self.datePickerView.alpha = 0;
    [self.navigationController.view addSubview:self.datePickerView];
    [UIView animateWithDuration:0.2 animations:^{
        self.datePickerView.alpha = 1;
        self.datePickerView.backView.frame = CGRectMake(0.f, self.view.frame.size.height-220.f, self.view.frame.size.width, 220.f);
    }];
}

- (void)datePickerView:(TMDatePickerView *)datePickerView withDate:(NSString *)dateString {
    [UIView animateWithDuration:0.2 animations:^{
        self.datePickerView.alpha = 0;
        self.datePickerView.backView.frame = CGRectMake(0.f, self.view.frame.size.height, self.view.frame.size.width, 220.f);
    } completion:^(BOOL finished) {
        [self.datePickerView removeFromSuperview];
    }];
    
    if (dateString) {
        self.dateLabel.text = dateString;
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss SSS";
        NSDate * date = [formatter dateFromString:dateString];
        NSString * unixTime = [NSString stringWithFormat:@"%lld",(long long)([date timeIntervalSince1970]*1000)];
        
        NSDate * threeDate = [date dateByAddingTimeInterval:3 * 24 * 60 * 60];
        NSString * threeString = [formatter stringFromDate:threeDate];
        
        NSLog(@"%@_____%@",unixTime,threeString);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
