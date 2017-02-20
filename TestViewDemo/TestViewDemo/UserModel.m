//
//  UserModel.m
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
