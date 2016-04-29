//
//  TMCustomAlertView.h
//  CustomAlertViewDemo
//
//  Created by Taskmall on 16/4/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMCustomAlertView;
@protocol TMCustomAlertViewDelegate <NSObject>

- (void)customAlertView:(TMCustomAlertView *)customView withTag:(NSInteger)tag;

@end

@interface TMCustomAlertView : UIView

@property (nonatomic,weak) id<TMCustomAlertViewDelegate> delegate;

@end
