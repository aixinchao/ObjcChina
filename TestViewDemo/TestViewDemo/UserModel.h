//
//  UserModel.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/13.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
