//
//  TMFMDBManager.m
//  FMDBDemo
//
//  Created by Taskmall on 16/4/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMFMDBManager.h"
#import "TMSliderModel.h"

static FMDatabaseQueue * __FMDatabaseQueue = nil;

@implementation TMFMDBManager

+ (id)shareInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"InfoChatsList"];
        __FMDatabaseQueue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    });
    
    return __FMDatabaseQueue;
}

+ (void)initialize {
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS NotificationList(id TEXT PRIMARY KEY,title TEXT,imgUrl TEXT,slideType TEXT,taskType TEXT,taskID TEXT,url TEXT,iosUrl TEXT,iosStoreUrl TEXT,androidUrl TEXT,androidStoreUrl TEXT,type TEXT,toResponser TEXT,content TEXT,notificationType TEXT,status TEXT,addTime TEXT,uid1 TEXT,nickname1 TEXT,portrait1 TEXT,uid2 TEXT,nickname2 TEXT,portrait2 TEXT,updateTime TEXT,unreadQuantity TEXT,fromSender TEXT,isMe TEXT)"];
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS ChatsList(id TEXT PRIMARY KEY,listID TEXT,toResponser TEXT,content TEXT,addTime TEXT,uid1 TEXT,nickname1 TEXT,portrait1 TEXT,updateTime TEXT,fromSender TEXT)"];
    }];
}

#pragma mark -- 增
//插入NotificationList列表信息
+ (void)insertNotificationDataModel:(TMSliderModel *)sliderModel {
    
    NSString * insertData = [NSString stringWithFormat:@"INSERT INTO NotificationList(id,title,imgUrl,slideType,taskType,taskID,url,iosUrl,iosStoreUrl,androidUrl,androidStoreUrl,type,toResponser,content,notificationType,status,addTime,uid1,nickname1,portrait1,uid2,nickname2,portrait2,updateTime,unreadQuantity,fromSender,isMe) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"];
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            [db executeUpdate:insertData];
        } else {
            NSLog(@"插入数据打开数据库失败");
        }
    }];
}

#pragma mark -- 删
//删除NotificationList列表信息
+ (void)deleteNotificationInfo:(TMSliderModel *)slider {
    NSString * deleteData = [NSString stringWithFormat:@"DELETE FROM NotificationList WHERE id = '%@'",slider.slideID];
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            [db executeUpdate:deleteData];
        } else {
            NSLog(@"删除数据打开数据库失败");
        }
    }];
}

//删除NotificationList所有消息
+ (void)deleteAllNotificationInfo:(TMSliderModel *)slider {
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            [db executeUpdate:@"DELETE FROM NotificationList"];
        } else {
            NSLog(@"删除所有数据打开数据库失败");
        }
    }];
}

#pragma mark -- 改
//修改NotificationList列表信息
+ (void)updateNotificationInfo:(TMSliderModel *)slider {
    NSString * updateData = [NSString stringWithFormat:@"UPDATE NotificationList SET content = '%@',addTime = '%@' WHERE id = '%@'",slider.content,slider.addTime,slider.slideID];
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            [db executeUpdate:updateData];
        } else {
            NSLog(@"修改数据打开数据库失败");
        }
    }];
}

#pragma mark -- 查
//查询NotificationList数据是否存在
+ (void)searchNotificationIDIsExists:(TMSliderModel *)slider {
    NSString * searchData = [NSString stringWithFormat:@"SELECT * FROM NotificationList WHERE id = '%@'",slider.slideID];
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            FMResultSet * set = [db executeQuery:searchData];
            if (set.columnCount > 0) {
                //修改数据
                [self updateNotificationInfo:slider];
            } else {
                //插入数据
                [self insertNotificationDataModel:slider];
            }
        } else {
            NSLog(@"查询数据打开数据库失败");
        }
    }];
}

//查询NotificationList所有数据
+ (NSMutableArray *)searchNotificationAllData {
    NSString * searchAllData = [NSString stringWithFormat:@"SELECT * FROM NotificationList ORDER BY addTime DESC"];
    NSMutableArray * dataArray = [NSMutableArray arrayWithCapacity:0];
    FMDatabaseQueue * queue = [self shareInstance];
    [queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            FMResultSet * set = [db executeQuery:searchAllData];
            while ([set next]) {
                TMSliderModel * slider = [[TMSliderModel alloc] init];
                slider.slideID = [set stringForColumn:@"id"];
                slider.title = [set stringForColumn:@"title"];
                slider.imgUrl = [set stringForColumn:@"imgUrl"];
                slider.slideType = [set stringForColumn:@"slideType"];
                slider.taskType = [set stringForColumn:@"taskType"];
                slider.taskID = [set stringForColumn:@"taskID"];
                slider.url = [set stringForColumn:@"url"];
                slider.iosUrl = [set stringForColumn:@"iosUrl"];
                slider.iosStoreUrl = [set stringForColumn:@"iosStoreUrl"];
                slider.androidUrl = [set stringForColumn:@"androidUrl"];
                slider.androidStoreUrl = [set stringForColumn:@"androidStoreUrl"];
                slider.type = [set stringForColumn:@"type"];
                slider.toResponser = [set stringForColumn:@"toResponser"];
                slider.content = [set stringForColumn:@"content"];
                slider.notificationType = [set stringForColumn:@"notificationType"];
                slider.status = [set stringForColumn:@"status"];
                slider.addTime = [set stringForColumn:@"addTime"];
                slider.uid1 = [set stringForColumn:@"uid1"];
                slider.nickname1 = [set stringForColumn:@"nickname1"];
                slider.portrait1 = [set stringForColumn:@"portrait1"];
                slider.uid2 = [set stringForColumn:@"uid2"];
                slider.nickname2 = [set stringForColumn:@"nickname2"];
                slider.portrait2 = [set stringForColumn:@"portrait2"];
                slider.updateTime = [set stringForColumn:@"updateTime"];
                slider.unreadQuantity = [set stringForColumn:@"unreadQuantity"];
                slider.fromSender = [set stringForColumn:@"fromSender"];
                slider.isMe = [set stringForColumn:@"isMe"];
                
                [dataArray addObject:slider];
            }
        } else {
            NSLog(@"查询NotificationList所有数据打开数据库失败");
        }
    }];
    
    return dataArray;
}

@end
