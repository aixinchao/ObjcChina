//
//  ViewController.m
//  WebViewDemo
//
//  Created by Taskmall on 16/3/3.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIWebViewDemo";
    self.view.backgroundColor = [UIColor greenColor];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.f, 0.f, 375.f, 1.f)];
    self.webView.delegate = self;
//    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://taskmall.oss-cn-hangzhou.aliyuncs.com/resource_img/IMG_0535.JPG"]];
//    [self.webView loadRequest: request];
    [self.webView loadHTMLString:[NSString stringWithFormat:@"<div style=\"color:#5d5d5d\">%@</div>",@"<p><img src=\"https://taskmall.oss-cn-hangzhou.aliyuncs.com/resource_img/IMG_0535.JPG\" width=\"100%\" /></p>"] baseURL:nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 300.f, 60.f, 30.f);
    button.layer.cornerRadius = 5.f;
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    UIView * oldView = [cell viewWithTag:520];
    [oldView removeFromSuperview];
    
    [cell addSubview:[self createCellView:indexPath]];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView * cellView = [self createCellView:indexPath];
    
    return cellView.frame.size.height + 10.f;
}

- (UIView *)createCellView:(NSIndexPath *)indexPath {
    UIView * cellView = [[UIView alloc] init];
    cellView.backgroundColor = [UIColor whiteColor];
    cellView.tag = 520;
    
    [cellView addSubview:self.webView];
    cellView.frame = CGRectMake(0.f, 0.f, 375.f, 44.f);
    
    return cellView;
}

- (void)buttonClick:(UIButton *)sender {
//    [self.webView.scrollView setContentOffset:CGPointMake(0.f, 0.f) animated:YES];
    //http://www.cnblogs.com/xiaofeixiang/p/4307573.html
    
    BaseViewController * baseVC = [[BaseViewController alloc] init];
    [self.navigationController pushViewController:baseVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.y);
}

#pragma mark -- UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"123");
    [self.webView.scrollView setContentOffset:CGPointMake(0.f, 100.f) animated:YES];
    CGFloat webViewHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    self.webView.frame = CGRectMake(0, 0, 375.f,webViewHeight+10.f);
    [self.tableView reloadData];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
