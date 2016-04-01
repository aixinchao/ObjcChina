//
//  TMDatePickerView.h
//  TMDataPicker
//
//  Created by Taskmall on 16/3/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMDatePickerView;
@protocol TMDatePickerViewDelegate <NSObject>

- (void)datePickerView:(TMDatePickerView *)datePickerView withDate:(NSString *)dateString;

@end

@interface TMDatePickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

- (id)initWithFrame:(CGRect)frame with:(NSString *)dateString;

@property (nonatomic,weak) id<TMDatePickerViewDelegate> delegate;
@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIPickerView * pickerView;
@property (nonatomic,strong) NSString * dateString;

@property (nonatomic,strong) NSMutableArray * yearArray;   //年
@property (nonatomic,strong) NSMutableArray * monthArray;  //月
@property (nonatomic,strong) NSMutableArray * dayArray;    //日
@property (nonatomic,strong) NSMutableArray * hourArray;   //时
@property (nonatomic,strong) NSMutableArray * minuteArray; //分

@end
