//
//  ViewController.m
//  KYElegantPhotoDemo
//
//  Created by Taskmall on 16/8/19.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "KYPhotoGallery.h"
#import "Macro.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray * urlImagesArray;
@property (nonatomic,strong) NSMutableArray * imageViewArray;
@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"图片滑动";
    self.urlImagesArray = [NSMutableArray arrayWithObjects:@"https://taskmall-dev.oss-cn-hangzhou.aliyuncs.com/resource_img/de10de7e7ddf409b93cf76bba80057c7.jpg",
                           @"http://ww3.sinaimg.cn/bmiddle/53932067gw1esphcqgpurj20gy09bq46.jpg",
                           @"http://wx.qlogo.cn/mmopen/HxrPtUzTwSVfWbdZLJ7DSNFmvxxuEjicCicP8qpwib5OKSpMgB5Nib5eEqFPY8fT7brkshnUhAWACqM99vG3ch9Ytnr5oI4ibMQEz/0",
                           @"http://ww4.sinaimg.cn/bmiddle/53932067gw1eshmw8t1s9j20jt0bw77l.jpg", nil];
    self.imageViewArray = [NSMutableArray arrayWithCapacity:0];
    UIImageView * imageOne = [[UIImageView alloc] initWithFrame:CGRectMake(20.f, 80.f, 80.f, 80.f)];
    imageOne.clipsToBounds = YES;
    imageOne.contentMode = UIViewContentModeScaleAspectFill;
    [imageOne sd_setImageWithURL:[self.urlImagesArray objectAtIndex:0] placeholderImage:[UIImage imageNamed:@""]];
    imageOne.tag = 1;
    imageOne.userInteractionEnabled = YES;
    [self.view addSubview:imageOne];
    [self.imageViewArray addObject:imageOne];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [imageOne addGestureRecognizer:tap];
    
    UIImageView * imageTwo = [[UIImageView alloc] initWithFrame:CGRectMake(160.f, 100.f, 80.f, 80.f)];
    imageTwo.contentMode = UIViewContentModeScaleAspectFill;
    imageTwo.tag = 2;
    imageTwo.userInteractionEnabled = YES;
    imageTwo.clipsToBounds = YES;
    [imageTwo sd_setImageWithURL:[self.urlImagesArray objectAtIndex:1] placeholderImage:[UIImage imageNamed:@""]];
    [self.view addSubview:imageTwo];
    [self.imageViewArray addObject:imageTwo];
    UITapGestureRecognizer * tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [imageTwo addGestureRecognizer:tapTwo];
    
    self.tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 180.f, self.view.frame.size.width, self.view.frame.size.height-180.f) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)imageTap:(UIGestureRecognizer *)tap {
    if (self.imageViewArray.count != 4) {
        for (int i = 0; i < 2; i++) {
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            UIView * cellView = [cell viewWithTag:520];
            UIImageView * imageView = [cellView viewWithTag:3+i];
            [self.imageViewArray addObject:imageView];
        }
    }
    KYPhotoGallery * photoGallery = [KYPhotoGallery sharedKYPhotoGallery];
    [photoGallery tappedImageView:(UIImageView *)tap.view andImageUrls:self.urlImagesArray andInitialIndex:tap.view.tag];
    photoGallery.imageViewArray = self.imageViewArray;
    [photoGallery finishAsynDownload:^{
        [self presentViewController:photoGallery animated:NO completion:nil];
    }];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UIView * cellView = [cell viewWithTag:520];
    [cellView removeFromSuperview];
    
    [cell addSubview:[self createCellView:indexPath]];
    return cell;
}

- (UIView *)createCellView:(NSIndexPath *)indexPath {
    UIView * cellView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 5.f, self.view.frame.size.width, 90.f)];
    cellView.tag = 520;
    cellView.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20.f, 5.f, 80.f, 80.f);
    [cellView addSubview:button];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 80.f, 80.f)];
    imageView.tag = 3+indexPath.row;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = YES;
    [imageView sd_setImageWithURL:[self.urlImagesArray objectAtIndex:indexPath.row+2] placeholderImage:[UIImage imageNamed:@""]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [button addSubview:imageView];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [imageView addGestureRecognizer:tap];
    
    return cellView;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
