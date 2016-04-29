//
//  TMSliderModel.m
//  CoreDataDemo
//
//  Created by Taskmall on 16/4/20.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMSliderModel.h"
#import "AppDelegate.h"

@implementation TMSliderModel

@synthesize slideID = _slideID;
@synthesize title = _title;
@synthesize imgUrl = _imgUrl;
@synthesize slideType = _slideType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        self.slideID = [dict objectForKey:@"id"];
        self.title = [dict objectForKey:@"title"];
        self.imgUrl = [dict objectForKey:@"imgUrl"];
        self.slideType = [dict objectForKey:@"slideType"];
    }
    
    return self;
}

@end
