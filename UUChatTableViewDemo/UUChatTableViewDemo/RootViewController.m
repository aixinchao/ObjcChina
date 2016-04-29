//
//  RootViewController.m
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/5.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"
#import "TMSlideModel.h"
#import "TMInputFunctionView.h"
#import "TMMessageCell.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView * chatTableView;
@property (strong, nonatomic) NSMutableArray * slideArray;
@property (strong, nonatomic) TMInputFunctionView * inputView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"能年玲奈";
    self.view.backgroundColor = [UIColor grayColor];
    self.slideArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 8; i++) {
        [self.slideArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    self.chatTableView = [[UITableView alloc] init];
    self.chatTableView.delegate = self;
    self.chatTableView.dataSource = self;
    self.chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.chatTableView];
    self.chatTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_chatTableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_chatTableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_chatTableView]-40-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_chatTableView)]];
    
    UITapGestureRecognizer * tableViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewTapWithSelector:)];
    [self.chatTableView addGestureRecognizer:tableViewTap];
    
    [self initBar];
    [self addRefreshViews];
    [self loadBaseViewsAndData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tableViewScrollToBottom) name:UIKeyboardDidShowNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initBar {
    
}

- (void)addRefreshViews {
    
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"加载更多..." forState:MJRefreshStateIdle];
    [header setTitle:@"加载中..." forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    self.chatTableView.mj_header = header;
    
//    self.chatTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self.chatTableView.mj_header endRefreshing];
//    }];
}

- (void)loadNewData {
    for (int i = 0; i < 4; i++) {
        [self.slideArray insertObject:@"走着,走着,天就慢慢亮了,仿佛来过这地方." atIndex:0];
    }
    [self.chatTableView.mj_header endRefreshing];
    [self.chatTableView reloadData];
}

- (void)loadBaseViewsAndData {
    self.inputView = [[TMInputFunctionView alloc] initWithSuperVC:self];
    [self.view addSubview:self.inputView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.slideArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TMMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[TMMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行",(long)indexPath.row];
    [cell setMessageFrameAndContent:nil withShowTime:YES];
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%ld行",(long)indexPath.row);
    [self.view endEditing:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

//keyboard change
- (void)keyboardChange:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    float bottomConstraint = 0.f;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    if (notification.name == UIKeyboardWillShowNotification) {
        bottomConstraint = keyboardEndFrame.size.height + 40.f;
    } else {
        bottomConstraint = 40.f;
    }
    NSLog(@"%@",self.view.constraints);
    NSArray * constrains = self.view.constraints;
    for (NSLayoutConstraint * constraint in constrains) {
        if (constraint.secondItem == self.chatTableView && constraint.firstAttribute == NSLayoutAttributeBottom) {
            constraint.constant = bottomConstraint;
            NSLog(@"%f___________-%@",bottomConstraint,self.chatTableView);
        }
    }
    [self.view layoutIfNeeded];
    
    CGRect newFrame = self.inputView.frame;
    newFrame.origin.y = keyboardEndFrame.origin.y - newFrame.size.height;
    self.inputView.frame = newFrame;
    [UIView commitAnimations];
    NSLog(@"%f__-%@",bottomConstraint,self.chatTableView);
}

//tableView scroll to bottom
- (void)tableViewScrollToBottom {
    
}

#pragma mark -- 键盘下去
- (void)tableViewTapWithSelector:(UIGestureRecognizer *)tap {
    [self.view endEditing:YES];
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
