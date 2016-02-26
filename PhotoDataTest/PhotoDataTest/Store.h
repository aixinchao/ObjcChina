//
//  Store.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype)store;

@property (readonly,nonatomic,strong) NSArray * photos;
@property (readonly,nonatomic,strong) NSArray * users;

- (NSArray *)sortedPhotos;

@end
