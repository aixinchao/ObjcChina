//
//  Photo.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface Photo : NSObject<NSCoding>

@property (nonatomic) int64_t identifier;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSDate * creationDate;
@property (nonatomic) double rating;

@property (nonatomic,strong) User * user;

- (NSString *)authorFullName;
- (double)adjustedRating;

@end
