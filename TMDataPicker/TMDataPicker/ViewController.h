//
//  ViewController.h
//  TMDataPicker
//
//  Created by Taskmall on 16/3/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDatePickerView.h"
#import "TMCityPickerView.h"

@interface ViewController : UIViewController<TMDatePickerViewDelegate,TMCityPickerViewDelegate>

@property (nonatomic,strong) TMDatePickerView * datePickerView;
@property (nonatomic,strong) TMCityPickerView * cityPickerView;
@property (nonatomic,strong) NSMutableDictionary * locationDict;
@property (nonatomic,strong) NSString * dateString;
@property (nonatomic,strong) UILabel * dateLabel;
@property (nonatomic,strong) UILabel * cityLabel;


@end

