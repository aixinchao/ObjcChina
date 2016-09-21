//
//  TMCollectionViewCell.h
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UILabel * catBeanLabel;
@property (nonatomic,strong) UILabel * valueLabel;
@property (nonatomic,strong) UILabel * remainLabel;
@property (nonatomic,strong) UIButton * exchangeButton;

@end
