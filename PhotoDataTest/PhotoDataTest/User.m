//
//  User.m
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "User.h"

static NSString * const IdentifierKey = @"identifier";
static NSString * const UsernameKey = @"username";
static NSString * const FirstNameKey = @"firstname";
static NSString * const LastNameKey = @"lastname";
static NSString * const PhotosKey = @"photos";

@implementation User

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> (%lld)\"%@\"",[self class],self,(long long)self.identifier,self.userName];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeInt64ForKey:IdentifierKey];
        self.userName = [aDecoder decodeObjectOfClass:[NSString class] forKey:UsernameKey];
        self.firstName = [aDecoder decodeObjectOfClass:[NSString class] forKey:FirstNameKey];
        self.lastName = [aDecoder decodeObjectOfClass:[NSString class] forKey:LastNameKey];
        self.photos = [aDecoder decodeObjectOfClass:[NSArray class] forKey:PhotosKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt64:self.identifier forKey:IdentifierKey];
    [aCoder encodeObject:self.userName forKey:UsernameKey];
    [aCoder encodeObject:self.firstName forKey:FirstNameKey];
    [aCoder encodeObject:self.lastName forKey:LastNameKey];
    [aCoder encodeObject:self.photos forKey:PhotosKey];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@",self.firstName,self.lastName];
}

- (NSUInteger)numberOfPhotosTaken {
    return self.photos.count;
}

@end
