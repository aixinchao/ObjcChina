//
//  TMSlideModel.h
//  Taskmall
//
//  Created by Taskmall on 16/3/11.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSlideModel : NSObject

@property (nonatomic,strong) NSString * slideID; //轮播id/系统消息id/聊天列表id/聊天id
@property (nonatomic,strong) NSString * title;   //轮播标题/系统消息id
@property (nonatomic,strong) NSString * imgUrl;  //轮播展示图片地址
@property (nonatomic,strong) NSString * slideType; //为WAP时不显示'APP'类型的轮播
@property (nonatomic,strong) NSString * taskType; //内部任务类型, 当slideType为'INNER_TASK'时显示
@property (nonatomic,strong) NSString * taskID;  //内部任务id, 当slideType为'INNER_TASK'时显示
@property (nonatomic,strong) NSString * url;   //链接地址, 当slideType为'INNER_HTML'或'OUTER_HTML'时显示
@property (nonatomic,strong) NSString * iosUrl;  //苹果地址, 当slideType为'APP'时显示
@property (nonatomic,strong) NSString * iosStoreUrl;  //苹果商店地址, 当slideType为'APP'时显示
@property (nonatomic,strong) NSString * androidUrl;  //安卓地址, 当slideType为'APP'时显示
@property (nonatomic,strong) NSString * androidStoreUrl;  //安卓商店地址, 当slideType为'APP'时显示

@property (nonatomic,strong) NSString * type;   //类型Notification或chat
@property (nonatomic,strong) NSString * toResponser;//接收者用户id
@property (nonatomic,strong) NSString * content;    //系统消息内容/最近一条聊天内容
@property (nonatomic,strong) NSString * notificationType; //通知动作类型, 可选值为'INNER_TASK','INNER_HTML','OUTER_HTML','APP'
@property (nonatomic,strong) NSString * status;  //状态, 'UNREAD', 'READ', 'DELETED'
@property (nonatomic,strong) NSString * addTime; //系统消息发出时间

@property (nonatomic,strong) NSString * uid1;  //参与用户1id
@property (nonatomic,strong) NSString * nickname1; //参与用户1昵称
@property (nonatomic,strong) NSString * portrait1; //参与用户1头像
@property (nonatomic,strong) NSString * uid2;  //参与用户2id
@property (nonatomic,strong) NSString * nickname2; //参与用户2昵称
@property (nonatomic,strong) NSString * portrait2;
@property (nonatomic,strong) NSString * updateTime; //系统消息发出时间
@property (nonatomic,strong) NSString * unreadQuantity; //未读消息数

@property (nonatomic,strong) NSString * fromSender; //发送用户id

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
