//
//  TMCollectionViewCell.m
//  IntegralDemo
//
//  Created by Taskmall on 16/8/30.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMCollectionViewCell.h"

@implementation TMCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, frame.size.width, frame.size.width)];
        self.imageView.image = [UIImage imageNamed:@"image.jpg"];
        self.imageView.layer.cornerRadius = 5.f;
        self.imageView.clipsToBounds = YES;
        [self addSubview:self.imageView];
        self.catBeanLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, frame.size.width+5.f, frame.size.width, 20.f)];
        self.catBeanLabel.textColor = [UIColor grayColor];
        self.catBeanLabel.font = [UIFont systemFontOfSize:15.f];
        self.catBeanLabel.text = @"猫豆：1000个";
        [self addSubview:self.catBeanLabel];
        self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, frame.size.width+25.f, frame.size.width, 20.f)];
        self.valueLabel.textColor = [UIColor grayColor];
        self.valueLabel.font = [UIFont systemFontOfSize:15.f];
        self.valueLabel.text = @"价值：1000个";
        [self addSubview:self.valueLabel];
        self.remainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, frame.size.width+45.f, frame.size.width, 20.f)];
        self.remainLabel.textColor = [UIColor grayColor];
        self.remainLabel.font = [UIFont systemFontOfSize:15.f];
        self.remainLabel.text = @"剩余：800份";
        [self addSubview:self.remainLabel];
        self.exchangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.exchangeButton.frame = CGRectMake(0.f, frame.size.width+70.f, frame.size.width, 30.f);
        self.exchangeButton.backgroundColor = [UIColor orangeColor];
        self.exchangeButton.titleLabel.font = [UIFont systemFontOfSize:16.f];
        self.exchangeButton.layer.cornerRadius = 5;
        self.exchangeButton.clipsToBounds = YES;
        [self.exchangeButton setTitle:@"立即兑换" forState:UIControlStateNormal];
        [self.exchangeButton addTarget:self action:@selector(exchangeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.exchangeButton];
    }
    
    return self;
}

- (void)exchangeButtonClick:(UIButton *)sender {
    NSLog(@"立即兑换");
}

@end
