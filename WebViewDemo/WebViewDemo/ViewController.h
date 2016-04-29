//
//  ViewController.h
//  WebViewDemo
//
//  Created by Taskmall on 16/3/3.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ViewController : UIViewController<UIWebViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIWebView * webView;
@property (nonatomic,strong) UITableView * tableView;


@end

