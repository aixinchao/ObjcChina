//
//  ViewController.m
//  CityData
//
//  Created by Taskmall on 16/6/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"location" ofType:@"db"];
    NSLog(@"%@",path);
    
    NSArray * array = @[@"1",@"2",@"3",@"4",@"5"];
    
    for (int i = 0; i < array.count; i++) {
        NSString * string = [array objectAtIndex:i];
        NSLog(@"111111");
        for (int j = 0; j < array.count; j++) {
            if (j == 1) {
                break;
            }
        }
    }
    
    FMDatabase * dataBase = [FMDatabase databaseWithPath:path];
    if ([dataBase open]) {
        NSLog(@"打开数据库成功！！！");
        FMResultSet * set = [dataBase executeQuery:@""];
        while ([set next]) {
            
        }
    } else {
        NSLog(@"打开数据库失败");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
