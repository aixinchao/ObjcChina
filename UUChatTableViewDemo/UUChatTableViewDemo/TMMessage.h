//
//  TMMessage.h
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/12.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MessageType) {
    TMMessageTypeText       = 0,    //文字
    TMMessageTypePicture    = 1,    //图片
};

typedef NS_ENUM(NSInteger, MessageFrom) {
    TMMessageFromMe     = 0,    //自己
    TMMessageFromOther  = 1,    //别人发的
};

@interface TMMessage : NSObject

@property (nonatomic,strong) NSString * strIcon;    //
@property (nonatomic,strong) NSString * strID;
@property (nonatomic,strong) NSString * strFromID;
@property (nonatomic,strong) NSString * strToID;


@end
