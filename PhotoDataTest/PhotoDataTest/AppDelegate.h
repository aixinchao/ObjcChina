//
//  AppDelegate.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/16.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (instancetype)sharedDelegate;

@property (strong, nonatomic) UIWindow *window;
@property (readonly,strong,nonatomic) Store * store;


@end

