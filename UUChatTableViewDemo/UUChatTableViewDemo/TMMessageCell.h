//
//  TMMessageCell.h
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/12.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMMessageFrame.h"
#import "TMMessageContentButton.h"
#import "TMSlideModel.h"

@interface TMMessageCell : UITableViewCell

@property (nonatomic,strong) UILabel * labelTime;
@property (nonatomic,strong) UIView * headImageBackView;
@property (nonatomic,strong) UIButton * btnHeadImage;
@property (nonatomic,strong) TMMessageContentButton * btnContent;

- (void)setMessageFrameAndContent:(TMSlideModel *)slideModel withShowTime:(BOOL)isShowTime;

@end
