//
//  TMCityPickerView.h
//  TMDataPicker
//
//  Created by Taskmall on 16/3/22.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMCityPickerView;
@protocol TMCityPickerViewDelegate <NSObject>

- (void)cityPickerView:(TMCityPickerView *)cityPicker withDate:(NSMutableDictionary *)dataDict;

@end

@interface TMCityPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

- (id)initWithFrame:(CGRect)frame with:(NSMutableDictionary *)dict;

@property (nonatomic,weak) id<TMCityPickerViewDelegate> delegate;
@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIPickerView * pickerView;
@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,strong) NSArray * cityArray;
@property (nonatomic,strong) NSString * province;
@property (nonatomic,strong) NSString * city;
@property (nonatomic,strong) NSString * locationID;

@end
