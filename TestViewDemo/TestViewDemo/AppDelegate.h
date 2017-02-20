//
//  AppDelegate.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/9.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <AdSupport/AdSupport.h>

@class BaseTabBarController,PerSideBarViewController,YQSlideMenuController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BaseTabBarController * tabBarVC;
@property (strong, nonatomic) PerSideBarViewController * perSideBarVC;
@property (strong, nonatomic) YQSlideMenuController * sideMenuController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (void)createTabBarVCWithPerSideBarVC;

@end

