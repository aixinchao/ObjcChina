//
//  NSObject+Common.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

- (NSString *)className;
+ (NSString *)className;

- (BOOL)isNull;

@end
