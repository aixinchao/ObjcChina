//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Taskmall on 16/4/20.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //http://www.cnblogs.com/jerehedu/p/4607368.html
    //http://allluckly.cn
    //https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（上）.md
    self.title = @"Core Data";
    self.view.backgroundColor = [UIColor grayColor];
    NSMutableArray * dataArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 4; i++) {
        NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",i],@"id",@"title",@"title",@"imgUrl",@"imgUrl",@"slideType",@"slideType", nil];
        TMSliderModel * sliderModel = [TMSliderModel modelObjectWithDictionary:dict];
        [dataArray addObject:sliderModel];
    }
    
    for (int i = 0; i < dataArray.count; i++) {
        TMSliderModel * sliderModel = [dataArray objectAtIndex:i];
//        NSLog(@"%@___%@___%@___%@",sliderModel.slideID,sliderModel.title,sliderModel.imgUrl,sliderModel.slideType);
    }
    
    NSLog(@"——————rel:%d",rel);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
