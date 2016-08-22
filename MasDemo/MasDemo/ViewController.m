//
//  ViewController.m
//  MasDemo
//
//  Created by Taskmall on 16/5/19.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"520";
//    NSLog(@"%@",NSHomeDirectory());
//    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"json"];
//    NSData * data = [[NSData alloc] initWithContentsOfFile:filePath];
//    NSArray * dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//    [dataArray writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/area.plist"] atomically:YES];
    
    UIButton * alertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alertButton.backgroundColor = [UIColor orangeColor];
    [alertButton setTitle:@"点 击" forState:UIControlStateNormal];
    alertButton.layer.cornerRadius = 5.f;
    alertButton.frame = CGRectMake(self.view.center.x-60.f, 160.f, 120.f, 40.f);
    [alertButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertButton];
    {
        NSLog(@"1111111111111111");
    }
    
//    CGFloat width = 60.f;
//    CGFloat height = 80.f;
//    CGFloat viewHeight = self.view.frame.size.width/4.f;
//    for (int i = 0; i < 15; i++) {
//        UIView * view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor whiteColor];
//        [self.view addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@(110.f + (i/4*viewHeight)));
//            make.left.equalTo(@(viewHeight*(i%4)));
//            
//            make.width.equalTo(@(viewHeight));
//            make.height.equalTo(@(viewHeight));
//        }];
//        
//        UIButton * button;
//        if (i == 0) {
//            button = [UIButton buttonWithType:UIButtonTypeContactAdd];
//            button.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1];
//        } else {
//            button = [UIButton buttonWithType:UIButtonTypeCustom];
//            [button setTitle:@"桥本爱" forState:UIControlStateNormal];
//            button.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1];
//        }
//        
//        
//        button.layer.cornerRadius = 30.f;
//        button.titleLabel.font = [UIFont systemFontOfSize:15.f];
//        [view addSubview:button];
//        [button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@((viewHeight-height)/2.f));
//            make.left.equalTo(@((viewHeight-width)/2.f));
//            
//            make.width.equalTo(@60.f);
//            make.height.equalTo(@60.f);
//        }];
//        
//        UILabel * titleLabel = [[UILabel alloc] init];
//        if (i != 0) {
//            titleLabel.text = @"能年玲奈";
//        }
//        
//        titleLabel.font = [UIFont systemFontOfSize:13.f];
//        [view addSubview:titleLabel];
//        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(button.mas_bottom);
//            make.left.equalTo(@((viewHeight-width)/2.f));
//            
//            make.width.equalTo(@60.f);
//            make.height.equalTo(@20.f);
//        }];
//    }
    
}

- (void)buttonClick:(UIButton *)sender {
    {
        NSLog(@"1111111111111111");
    }
    TMPubOnSearchViewController * pubOnVC = [[TMPubOnSearchViewController alloc] init];
    [self.navigationController pushViewController:pubOnVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
