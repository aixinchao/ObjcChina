//
//  ViewController.m
//  IntegralDemo
//
//  Created by Taskmall on 16/8/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"
#import "TMCollectionViewCell.h"
#import "TMComplaintView.h"
#import "TMReceivingInfoView.h"
#import "TMExchangeSucView.h"
#import "TMGoodInfoView.h"

@interface ViewController ()

#define WEIGHT [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个item的大小
    self.flowLayout.itemSize = CGSizeMake((WEIGHT-70.f)/3, (WEIGHT-70.f)/3+100.f);
    //设置footerReferenceSize
    self.flowLayout.footerReferenceSize = CGSizeMake(WEIGHT, 1.f);
    //设置列的最小间距,cell之间的距离
    self.flowLayout.minimumLineSpacing = 15.f;
    //设置最小行间距
    self.flowLayout.minimumInteritemSpacing = 10.f;
    //设置布局的内编剧
    self.flowLayout.sectionInset = UIEdgeInsetsMake(15.f, 20.f, 15.f, 20.f);
    //纵向滑动      UICollectionViewScrollDirectionHorizontal(横向滑动)
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[TMCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [self.view addSubview:self.collectionView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 100.f, 100.f, 30.f);
    button.layer.cornerRadius = 5.f;
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender {
    TMComplaintView * complaintView = [[TMComplaintView alloc] initWithFrame:self.view.frame type:@"0"];
    [self.navigationController.view addSubview:complaintView];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (18%3 == 0) {
        return 18/3;
    } else {
        return 18/3+1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (18%3 == /* DISABLES CODE */ (0)) {
        return 3;
    } else {
        if (18/3 == section) {
            return 18%3;
        } else {
            return 3;
        }
    }
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView * footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
    footer.backgroundColor = [UIColor blackColor];
    return footer;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%@区第%@行",@(indexPath.section),@(indexPath.row));
//    TMReceivingInfoView * receivingInfoView = [[TMReceivingInfoView alloc] initWithFrame:self.view.frame];
//    [self.navigationController.view addSubview:receivingInfoView];
//    TMExchangeSucView * exchangeSucView = [[TMExchangeSucView alloc] initWithFrame:self.view.frame];
//    [self.navigationController.view addSubview:exchangeSucView];
    TMGoodInfoView * goodInfoView = [[TMGoodInfoView alloc] initWithFrame:self.view.frame dataDict:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"key",@"key",@"image",@"image1", nil]];
    [self.navigationController.view addSubview:goodInfoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
