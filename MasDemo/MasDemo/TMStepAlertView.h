//
//  TMStepAlertView.h
//  MasDemo
//
//  Created by Taskmall on 16/7/4.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry/Masonry.h"

@interface TMStepAlertView : UIView

@property (nonatomic,strong) NSDictionary * dataDict;

- (id)initWithFrame:(CGRect)frame dataDict:(NSDictionary *)dataDict;

@end
