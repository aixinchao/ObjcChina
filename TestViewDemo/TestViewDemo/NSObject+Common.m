//
//  NSObject+Common.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "NSObject+Common.h"

@implementation NSObject (Common)

- (NSString *)className {
    return NSStringFromClass([self class]);
}
+ (NSString *)className {
    return NSStringFromClass([self class]);
}

- (BOOL)isNull {
    if (!self) {
        return YES;
    }
    if ([self isEqual:[NSNull null]]) {
        return YES;
    } else if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if ([((NSString *)self) isEqualToString:@"(null)"]) {
            return YES;
        }
    }
    return NO;
}

@end
