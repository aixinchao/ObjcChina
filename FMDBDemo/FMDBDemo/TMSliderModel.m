//
//  TMSliderModel.m
//  FMDBDemo
//
//  Created by Taskmall on 16/4/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMSliderModel.h"

@implementation TMSliderModel

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
        self.taskType = [dict objectForKey:@"taskType"];
        self.taskID = [dict objectForKey:@"taskId"];
        self.url = [dict objectForKey:@"url"];
        self.iosUrl = [dict objectForKey:@"iosUrl"];
        self.iosStoreUrl = [dict objectForKey:@"iosStoreUrl"];
        self.androidUrl = [dict objectForKey:@"androidUrl"];
        self.androidStoreUrl = [dict objectForKey:@"androidStoreUrl"];
        
        self.type = [dict objectForKey:@"type"];
        self.toResponser = [dict objectForKey:@"to"];
        self.content = [dict objectForKey:@"content"];
        self.notificationType = [dict objectForKey:@"notificationType"];
        self.status = [dict objectForKey:@"status"];
        self.addTime = [dict objectForKey:@"addTime"];
        
        self.uid1 = [dict objectForKey:@"uid1"];
        self.nickname1 = [dict objectForKey:@"nickname1"];
        self.portrait1 = [dict objectForKey:@"portrait1"];
        self.uid2 = [dict objectForKey:@"uid2"];
        self.nickname2 = [dict objectForKey:@"nickname2"];
        self.portrait2 = [dict objectForKey:@"portrait2"];
        self.updateTime = [dict objectForKey:@"updateTime"];
        self.unreadQuantity = [dict objectForKey:@"unreadQuantity"];
        
        self.fromSender = [dict objectForKey:@"from"];
    }
    
    return self;
}

@end
