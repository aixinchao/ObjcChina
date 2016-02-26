//
//  Store.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

//Store对象会关心数据加载,缓存和设置数据栈,它也经常被称为服务层或者仓库
@interface Store : NSObject

+ (instancetype)store;

@property (readonly,nonatomic,strong) NSArray * photos;
@property (readonly,nonatomic,strong) NSArray * users;

- (NSArray *)sortedPhotos;

@end
