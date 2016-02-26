//
//  Store.m
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "Store.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Store

+ (instancetype)store {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        [self readArchive];
    }
    
    return self;
}

- (void)readArchive {
    //详解http://blog.csdn.net/shx_yi/article/details/8755415 根据类名获取NSBundle 在通过NSBundle获取资源
    NSURL * archiveURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"photodata" withExtension:@"bin"];
    //详解http://www.iliunian.com/923.html 类似NSLog
    NSAssert(archiveURL != nil, @"Unable to find archive in bundle.");
    NSData * data = [NSData dataWithContentsOfURL:archiveURL options:0 error:NULL];
    //数据反序列化 http://www.jianshu.com/p/fb8c9a808904
    NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    _users = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
    _photos = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
    [unarchiver finishDecoding];
}

- (NSArray *)sortedPhotos {
    return [self.photos sortedArrayUsingComparator:^NSComparisonResult(Photo * photo1, Photo * photo2) {
        //日期排序
        return [photo2.creationDate compare:photo1.creationDate];
    }];
}

@end
