//
//  UIButton+TMBadge.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/19.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "UIButton+TMBadge.h"

@implementation UIButton (TMBadge)

//显示数字角标
- (void)showBadgeOnImageViewIndex:(NSString *)indexString {
    
    [self removeBadgeOnImageViewIndex:indexString];
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, -8.f, 16.f, 16.f)];
    titleLabel.font = [UIFont systemFontOfSize:10.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.layer.cornerRadius = 8.f;
    titleLabel.clipsToBounds = YES;
    titleLabel.backgroundColor = [UIColor redColor];
    if (indexString.length == 1) {
        titleLabel.text = indexString;
    } else if (indexString.length == 2) {
        titleLabel.text = indexString;
        titleLabel.frame = CGRectMake(20.f, -8.f, 20.f, 16.f);
    } else if (indexString.length > 2) {
        titleLabel.text = @"99+";
        titleLabel.frame = CGRectMake(18.f, -8.f, 26.f, 16.f);
    }
    titleLabel.tag = 520;
    [self addSubview:titleLabel];
}
//隐藏数字角标
- (void)hideBadgeOnImageViewIndex:(NSString *)indexString {
    [self removeBadgeOnImageViewIndex:indexString];
}

- (void)removeBadgeOnImageViewIndex:(NSString *)indexString {
    for (UILabel * subView in self.subviews) {
        if (subView.tag == 520) {
            [subView removeFromSuperview];
        }
    }
}

@end
