//
//  TMPubOnSearchViewController.m
//  MasDemo
//
//  Created by Taskmall on 16/7/4.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMPubOnSearchViewController.h"

@interface TMPubOnSearchViewController ()

@end

@implementation TMPubOnSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"体验好评";
    [self createHeadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 109.f, self.view.frame.size.width, self.view.frame.size.height-109.f) style:UITableViewStyleGrouped];
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    [self.view addSubview:self.dataTableView];
    [self.dataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)createHeadView {
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 64.f, self.view.frame.size.width, 45.f)];
    [self.view addSubview:self.headView];
    self.waitButtonImage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.waitButtonImage.tag = 1000;
    [self.waitButtonImage setBackgroundImage:[UIImage imageNamed:@"waiting01"] forState:UIControlStateNormal];
    self.waitButtonImage.frame = CGRectMake(self.view.frame.size.width/4-40.f, 13.5, 17.f, 18.f);
    [self.waitButtonImage addTarget:self action:@selector(waitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.waitButtonImage];
    self.waitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.waitButton.tag = 1000;
    self.waitButton.frame = CGRectMake(self.view.frame.size.width/4-20.f, 7.5, 60.f, 30.f);
    [self.waitButton setTitleColor:[UIColor colorWithRed:60/255.0 green:178/255.0 blue:146/255.0 alpha:1] forState:UIControlStateNormal];
    [self.waitButton setTitle:@"待确认" forState:UIControlStateNormal];
    [self.waitButton addTarget:self action:@selector(waitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.waitButton];
    self.lastButton = self.waitButton;
    UIView * lineView = [[UIView alloc] init];
    lineView.center = CGPointMake(self.headView.center.x, 22.5);
    lineView.bounds = CGRectMake(0.f, 0.f, 1.f, 35.f);
    lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
    [self.headView addSubview:lineView];
    self.allButtonImage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.allButtonImage.tag = 1001;
    [self.allButtonImage setBackgroundImage:[UIImage imageNamed:@"all02"] forState:UIControlStateNormal];
    self.allButtonImage.frame = CGRectMake(3*self.view.frame.size.width/4-40.f, 13.5, 17.f, 18.f);
    [self.allButtonImage addTarget:self action:@selector(waitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.allButtonImage];
    self.allButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.allButton.tag = 1001;
    self.allButton.frame = CGRectMake(3*self.view.frame.size.width/4-20.f, 7.5, 40.f, 30.f);
    [self.allButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.allButton setTitle:@"全部" forState:UIControlStateNormal];
    [self.allButton addTarget:self action:@selector(waitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.allButton];
}

- (void)waitButtonClick:(UIButton *)sender {
    if (sender.tag == self.lastButton.tag) {
        return;
    }
    
    if (sender.tag == 1000) {
        [self.allButtonImage setBackgroundImage:[UIImage imageNamed:@"all02"] forState:UIControlStateNormal];
        [self.allButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.waitButtonImage setBackgroundImage:[UIImage imageNamed:@"waiting01"] forState:UIControlStateNormal];
        [self.waitButton setTitleColor:[UIColor colorWithRed:60/255.0 green:178/255.0 blue:146/255.0 alpha:1] forState:UIControlStateNormal];
    } else {
        [self.allButtonImage setBackgroundImage:[UIImage imageNamed:@"all01"] forState:UIControlStateNormal];
        [self.allButton setTitleColor:[UIColor colorWithRed:60/255.0 green:178/255.0 blue:146/255.0 alpha:1] forState:UIControlStateNormal];
        [self.waitButtonImage setBackgroundImage:[UIImage imageNamed:@"waiting02"] forState:UIControlStateNormal];
        [self.waitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    self.lastButton = sender;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView * oldView = [cell viewWithTag:520];
    [oldView removeFromSuperview];
    
    [cell addSubview:[self createCellViewIndexPath:indexPath]];
    
    return cell;
}

- (UIView *)createCellViewIndexPath:(NSIndexPath *)indexPath {
    UIView * cellView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 5.f, self.view.frame.size.width, 40.f)];
    cellView.tag = 520.f;
    cellView.backgroundColor = [UIColor whiteColor];
    
    UILabel * nickLabel = [[UILabel alloc] init];
    nickLabel.frame = CGRectMake(10.f, 5.f, 90.f, 30.f);
    nickLabel.text = @"生活不止 眼前的苟且 还有诗和远方的田野";
    nickLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    nickLabel.textAlignment = NSTextAlignmentCenter;
    nickLabel.backgroundColor = [UIColor orangeColor];
    nickLabel.textColor = [UIColor blueColor];
    nickLabel.font = [UIFont systemFontOfSize:12.f];
    [cellView addSubview:nickLabel];
    
    UIView * stepView = [[UIView alloc] init];
    stepView.frame = CGRectMake(105.f, 5.f, self.view.frame.size.width-160.f, 30.f);
    stepView.backgroundColor = [UIColor redColor];
    [cellView addSubview:stepView];
    for (int i = 0; i < 5; i ++) {
        UIButton * stepButton = [UIButton buttonWithType:UIButtonTypeCustom];
        stepButton.layer.cornerRadius = 5.f;
        stepButton.frame = CGRectMake((self.view.frame.size.width-160.f)/5*i, 0.f, 30.f, 30.f);
        stepButton.backgroundColor = [UIColor yellowColor];
        [stepButton addTarget:self action:@selector(stepButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
        [stepView addSubview:stepButton];
    }
    
    UIButton * sendChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendChatButton.frame = CGRectMake(self.view.frame.size.width-45.f, 10.f, 30.f, 20.f);
    [sendChatButton setBackgroundImage:[UIImage imageNamed:@"chatXin"] forState:UIControlStateNormal];
    [sendChatButton addTarget:self action:@selector(sendChatButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cellView addSubview:sendChatButton];
    
    return cellView;
}

#pragma mark -- 步骤
- (void)stepButtonSelector:(UIButton *)sender {
    //@{@"id":@"1111",@"pos":@(1),@"duration":@(3600000),@"url":@"123",@"comment":@"苦海泛起爱浪,在时间难逃避命运",@"commitType":@"ALL",@"pic":@[@"1",@"2",@"3",@"4",@"5"]}
    TMStepAlertView * stepAlertView = [[TMStepAlertView alloc] initWithFrame:self.view.frame dataDict:@{@"id":@"1111",@"pos":@(1),@"duration":@(3600000),@"url":@"123",@"comment":@"苦海泛起爱浪 在时间难逃避命运 哎呦哎呦哎呦哎呦哎呦 你说你说我们要不要在一起 哎呦哎呦哎呦哎呦哎呦 你说你说我们要不要在一起",@"commitType":@"ALL",@"pic":@[@"1",@"2",@"3",@"4",@"5"],@"commitText":@"苦海泛起爱浪 在时间难逃避命运 哎呦哎呦哎呦哎呦哎呦 你说你说我们要不要在一起 哎呦哎呦哎呦哎呦哎呦 你说你说我们要不要在一起"}];
    [self.view addSubview:stepAlertView];
}

#pragma mark -- 站内信
- (void)sendChatButtonClick:(UIButton *)sender {
    
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * cellView = [[UIView alloc] init];
    cellView.backgroundColor = [UIColor whiteColor];
    cellView.frame = CGRectMake(0.f, 0.f, self.view.frame.size.width, 40.f);
    
    UILabel * nickLabel = [[UILabel alloc] init];
    nickLabel.frame = CGRectMake(10.f, 5.f, 90.f, 30.f);
    nickLabel.text = @"昵称";
    nickLabel.textAlignment = NSTextAlignmentCenter;
    nickLabel.backgroundColor = [UIColor orangeColor];
    nickLabel.textColor = [UIColor blueColor];
    nickLabel.font = [UIFont systemFontOfSize:15.f];
    [cellView addSubview:nickLabel];
    
    UILabel * stepLabel = [[UILabel alloc] init];
    stepLabel.frame = CGRectMake(105.f, 5.f, self.view.frame.size.width-160.f, 30.f);
    stepLabel.backgroundColor = [UIColor redColor];
    stepLabel.text = @"步骤";
    stepLabel.textAlignment = NSTextAlignmentCenter;
    stepLabel.textColor = [UIColor blueColor];
    stepLabel.font = [UIFont systemFontOfSize:15.f];
    [cellView addSubview:stepLabel];
    
    UILabel * statusLabel = [[UILabel alloc] init];
    statusLabel.backgroundColor = [UIColor greenColor];
    statusLabel.frame = CGRectMake(self.view.frame.size.width-50.f, 5.f, 40.f, 30.f);
    statusLabel.font = [UIFont systemFontOfSize:15.f];
    statusLabel.textColor = [UIColor blueColor];
    statusLabel.text = @"操作";
    statusLabel.textAlignment = NSTextAlignmentCenter;
    [cellView addSubview:statusLabel];
    
    return cellView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
