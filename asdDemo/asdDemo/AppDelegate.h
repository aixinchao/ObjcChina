//
//  AppDelegate.h
//  asdDemo
//
//  Created by Taskmall on 16/12/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <AdSupport/AdSupport.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

