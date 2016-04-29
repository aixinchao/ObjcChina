//
//  TMMessageCell.m
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/12.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMMessageCell.h"

@implementation TMMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 1、创建时间
        self.labelTime = [[UILabel alloc] init];
        self.labelTime.textAlignment = NSTextAlignmentCenter;
        self.labelTime.textColor = [UIColor grayColor];
        self.labelTime.font = [UIFont systemFontOfSize:11.f];
        [self.contentView addSubview:self.labelTime];
        
        // 2、创建头像
        self.headImageBackView = [[UIView alloc]init];
        self.headImageBackView.layer.cornerRadius = 21.f;
        self.headImageBackView.layer.masksToBounds = YES;
        self.headImageBackView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
        [self.contentView addSubview:self.headImageBackView];
        self.btnHeadImage = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnHeadImage.layer.cornerRadius = 20.f;
        self.btnHeadImage.layer.masksToBounds = YES;
//        [self.btnHeadImage addTarget:self action:@selector(btnHeadImageClick:)  forControlEvents:UIControlEventTouchUpInside];
        [self.headImageBackView addSubview:self.btnHeadImage];
        
        // 3、创建内容
        self.btnContent = [TMMessageContentButton buttonWithType:UIButtonTypeCustom];
        [self.btnContent setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnContent.titleLabel.font = [UIFont systemFontOfSize:14.f];
        self.btnContent.titleLabel.numberOfLines = 0;
        [self.btnContent addTarget:self action:@selector(btnContentClick)  forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btnContent];
        
    }
    
    return self;
}

- (void)btnContentClick {
    
}

//设置内容及Frame
- (void)setMessageFrameAndContent:(TMSlideModel *)slideModel withShowTime:(BOOL)isShowTime {
    
    if (isShowTime) {
        self.labelTime.bounds = CGRectMake(0.f, 0.f, 200.f, 20.f);
        self.labelTime.text = @"2016/4/5";
        self.labelTime.center = CGPointMake(Main_Screen_Width/2, 20.f);
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
