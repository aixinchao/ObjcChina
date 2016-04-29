//
//  TMSliderModel.h
//  CoreDataDemo
//
//  Created by Taskmall on 16/4/20.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TMSliderModel : NSObject

@property (nonatomic,strong) NSString * slideID; //轮播id/系统消息id/聊天列表id/聊天id
@property (nonatomic,strong) NSString * title;   //轮播标题/系统消息id
@property (nonatomic,strong) NSString * imgUrl;  //轮播展示图片地址
@property (nonatomic,strong) NSString * slideType; //为WAP时不显示'APP'类型的轮播

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
