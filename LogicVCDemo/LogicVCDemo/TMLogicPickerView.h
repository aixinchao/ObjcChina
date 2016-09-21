//
//  TMLogicPickerView.h
//  LogicVCDemo
//
//  Created by Taskmall on 16/8/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMLogicPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

- (id)initWithFrame:(CGRect)frame with:(NSMutableArray *)dataArray;

@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIPickerView * pickerView;
@property (nonatomic,strong) NSMutableArray * dataArray;

@end
