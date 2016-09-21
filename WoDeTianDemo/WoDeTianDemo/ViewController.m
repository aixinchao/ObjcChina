//
//  ViewController.m
//  WoDeTianDemo
//
//  Created by Taskmall on 16/9/9.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.listTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    [self.view addSubview:self.listTableView];
    [self.listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.barButton = [[UIBarButtonItem alloc] initWithTitle:@"排序" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonSystemItemEditSelector:)];
    self.barButton.tag = 1000;
    self.navigationItem.rightBarButtonItem = self.barButton;
    
}

- (void)barButtonSystemItemEditSelector:(UIBarButtonItem *)barButton {
    if (barButton.tag == 1000) {
        [self.listTableView setEditing:YES animated:YES];
        barButton.title = @"关闭";
        barButton.tag = 1001;
    } else {
        [self.listTableView setEditing:NO animated:YES];
        barButton.title = @"排序";
        barButton.tag = 1000;
    }
    [self.listTableView reloadData];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    UIView * oldView = [cell viewWithTag:520];
//    [oldView removeFromSuperview];
//    [cell addSubview:[self createCellView:indexPath]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第 %@ 行",@(indexPath.row+1)];
    
    return cell;
}

- (UIView *)createCellView:(NSIndexPath *)indexPath {
    UIView * cellView = [[UIView alloc] init];
    cellView.backgroundColor = [UIColor whiteColor];
    cellView.tag = 520;
    
    return cellView;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.barButton.tag == 1000) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((editingStyle == UITableViewCellEditingStyleDelete) && indexPath) {
        NSLog(@"123");
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSLog(@"456");
//    [tableView reloadData];
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIView * cellView = [self createCellView:indexPath];
//    return cellView.frame.size.height + 10.f;
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%@",@(indexPath.row));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
