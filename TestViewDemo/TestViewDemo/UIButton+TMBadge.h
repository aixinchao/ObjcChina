//
//  UIButton+TMBadge.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/19.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TMBadge)

//显示数字角标
- (void)showBadgeOnImageViewIndex:(NSString *)indexString;
//隐藏数字角标
- (void)hideBadgeOnImageViewIndex:(NSString *)indexString;

@end
