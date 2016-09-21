//
//  ViewController.h
//  IntegralDemo
//
//  Created by Taskmall on 16/8/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic,strong) UICollectionView * collectionView;

@end

