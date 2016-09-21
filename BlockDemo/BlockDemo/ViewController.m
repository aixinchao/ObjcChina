//
//  ViewController.m
//  BlockDemo
//
//  Created by Taskmall on 16/9/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "TMComplaintView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150.f, 200.f, 100.f, 40.f);
    button.layer.cornerRadius = 5.f;
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender {
    TMComplaintView * complaintView = [[TMComplaintView alloc] initWithFrame:self.view.frame type:@"0"];
    complaintView.contentBlock = ^(NSString * content){
        NSLog(@"_____%@_____%@",content,self);
        //是否发生循环引用取决于 self是否持有block
    };
    [self.navigationController.view addSubview:complaintView];
}

- (void)dealloc {
    NSLog(@"ViewController: dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
