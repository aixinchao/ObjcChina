//
//  Photo.m
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "Photo.h"

static NSString * const IdentifierKey = @"identifier";
static NSString * const NameKey = @"name";
static NSString * const CreationDateKey = @"creationDate";
static NSString * const RatingKey = @"rating";
static NSString * const UserKey = @"user";

@implementation Photo

//输出系统对象的信息是字符串,自定义对象输出是内存地址,重写description可以输出字符串自定义对象信息
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> (%lld)\"%@\"",[self class],self,(long long)self.identifier,self.name];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeInt64ForKey:IdentifierKey];
        //self.name = [aDecoder decodeObjectForKey:NameKey];(应该也可以)
        self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:NameKey];
        self.creationDate = [aDecoder decodeObjectOfClass:[NSData class] forKey:CreationDateKey];
        self.rating = [aDecoder decodeDoubleForKey:RatingKey];
        self.user = [aDecoder decodeObjectOfClass:[User class] forKey:UserKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt64:self.identifier forKey:IdentifierKey];
    [aCoder encodeObject:self.name forKey:NameKey];
    [aCoder encodeObject:self.creationDate forKey:CreationDateKey];
    [aCoder encodeDouble:self.rating forKey:RatingKey];
    [aCoder encodeConditionalObject:self.user forKey:UserKey];
}

- (NSString *)authorFullName {
    return self.user.fullName;
}

- (double)adjustedRating {
    double adjustedRating = (self.rating - 97)/3.0;
    if (adjustedRating < 0) {
        adjustedRating = 0;
    }
    return adjustedRating;
}

@end
