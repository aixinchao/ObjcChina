//
//  User.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property (nonatomic) int64_t identifier;
@property (nonatomic,strong) NSString * userName;
@property (nonatomic,strong) NSString * firstName;
@property (nonatomic,strong) NSString * lastName;
@property (nonatomic,strong) NSArray * photos;

- (NSString *)fullName;
- (NSUInteger)numberOfPhotosTaken;

@end
