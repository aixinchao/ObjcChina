//
//  ArrayDataSource.h
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TableViewCellConfigureBlock)(id cell, id item);

@interface ArrayDataSource : NSObject<UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic,strong) NSArray * items;
@property (nonatomic,strong) NSString * cellIdentifier;
@property (nonatomic,strong) TableViewCellConfigureBlock configureCellBlock;

@end
