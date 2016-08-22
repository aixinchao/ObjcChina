//
//  TMStepAlertView.m
//  MasDemo
//
//  Created by Taskmall on 16/7/4.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "TMStepAlertView.h"

@implementation TMStepAlertView

- (id)initWithFrame:(CGRect)frame dataDict:(NSDictionary *)dataDict {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.dataDict = dataDict;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick:)];
        [self addGestureRecognizer:tap];
        
        CGSize size = [[dataDict objectForKey:@"comment"] boundingRectWithSize:CGSizeMake(frame.size.width-90.f-40.f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.f]} context:nil].size;
        CGSize textSize = [[dataDict objectForKey:@"commitText"] boundingRectWithSize:CGSizeMake(frame.size.width-90.f-40.f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.f]} context:nil].size;
        
        UIView * bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 10.f;
        bgView.clipsToBounds = YES;
        bgView.bounds = CGRectMake(0.f, 0.f, frame.size.width-90.f, 65.f+size.height+15.f+135.f+65.f);
        bgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:bgView];
        
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.center = CGPointMake(bgView.frame.size.width/2, 30.f);
        titleLabel.bounds = CGRectMake(0.f, 0.f, 100.f, 40.f);
        titleLabel.text = @"任务确认";
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:18.f];
        [bgView addSubview:titleLabel];
        
        UIView * hView = [[UIView alloc] initWithFrame:CGRectMake(20.f, 50.f, frame.size.width-90.f-40.f, 1)];
        hView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
        [bgView addSubview:hView];
        
        if ([dataDict objectForKey:@"url"]) {
            
        }
        UIButton * urlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        urlButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        urlButton.titleLabel.numberOfLines = 2;
        urlButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [urlButton setTitle:[dataDict objectForKey:@"url"] forState:UIControlStateNormal];
        [urlButton setTitle:@"http://www.baidu.com" forState:UIControlStateNormal];
        [urlButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:urlButton.currentTitle];
        [attributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.f/255.f green:122.f/255.f blue:255.f/255.f alpha:1]} range:NSMakeRange(0, [@"http://www.baidu.com" length])];
        [attributedString addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)} range:NSMakeRange(0, [@"http://www.baidu.com" length])];
        [urlButton setAttributedTitle:attributedString forState:UIControlStateNormal];
        [urlButton addTarget:self action:@selector(urlButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:urlButton];
        [urlButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(hView.mas_bottom).offset(5.f);
            make.left.equalTo(@20.f);
            make.right.equalTo(@(-20.f));
            
            make.height.equalTo(@30.f);
        }];
        
        UIScrollView * commentScrollView = [[UIScrollView alloc] init];
        commentScrollView.showsHorizontalScrollIndicator = NO;
        [bgView addSubview:commentScrollView];
        [commentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(urlButton.mas_bottom);
            make.left.equalTo(@20.f);
            
            make.width.equalTo(@(frame.size.width-90.f-40.f));
            make.height.equalTo((size.height>=45.f)?@45.f:@(size.height));
        }];
        commentScrollView.contentSize = CGSizeMake(frame.size.width-90.f-40.f, size.height);
        
        UILabel * commentLabel = [[UILabel alloc] init];
        commentLabel.text = [dataDict objectForKey:@"comment"];
        commentLabel.numberOfLines = 0;
        commentLabel.textColor = [UIColor grayColor];
        commentLabel.font = [UIFont systemFontOfSize:13.f];
        [commentScrollView addSubview:commentLabel];
        [commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0.f);
            make.left.equalTo(@0.f);
            
            make.width.equalTo(@(frame.size.width-90.f-40.f));
            make.height.equalTo(@(size.height));
        }];
        
        UIView * lineTextView = [[UIView alloc] init];
        lineTextView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
        [bgView addSubview:lineTextView];
        [lineTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(commentScrollView.mas_bottom).offset(10.f);
            make.centerX.equalTo(bgView.mas_centerX);
            
            make.width.equalTo(@(frame.size.width-90.f-40.f));
            make.height.equalTo(@1.f);
        }];
        
        UIScrollView * textScrollView = [[UIScrollView alloc] init];
        textScrollView.showsHorizontalScrollIndicator = NO;
        [bgView addSubview:textScrollView];
        [textScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineTextView.mas_bottom).offset(10.f);
            make.left.equalTo(@20.f);
            
            make.width.equalTo(@(frame.size.width-90.f-40.f));
            make.height.equalTo((textSize.height>=45.f)?@45.f:@(textSize.height));
        }];
        textScrollView.contentSize = CGSizeMake(frame.size.width-90.f-40.f, textSize.height);
        
        UILabel * textLabel = [[UILabel alloc] init];
        textLabel.text = [dataDict objectForKey:@"comment"];
        textLabel.numberOfLines = 0;
        textLabel.textColor = [UIColor grayColor];
        textLabel.font = [UIFont systemFontOfSize:13.f];
        [textScrollView addSubview:textLabel];
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0.f);
            make.left.equalTo(@0.f);
            
            make.width.equalTo(@(frame.size.width-90.f-40.f));
            make.height.equalTo(@(textSize.height));
        }];
        
        UIScrollView * imageScrollView = [[UIScrollView alloc] init];
        imageScrollView.showsVerticalScrollIndicator = NO;
        [bgView addSubview:imageScrollView];
        [imageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(textScrollView.mas_bottom).offset(10.f);
            make.left.equalTo(@20.f);
            
            make.width.equalTo(@(frame.size.width-90.f-40.f));
            make.height.equalTo(@(50.f));
        }];
        imageScrollView.contentSize = CGSizeMake([[dataDict objectForKey:@"pic"] count]*70.f, 50.f);
        for (int i = 0; i < [[dataDict objectForKey:@"pic"] count]; i++) {
            UIButton * imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            imageButton.tag = 1000+i;
            [imageButton addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [imageScrollView addSubview:imageButton];
            [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0.f);
                make.left.equalTo(@(i*70.f));
                
                make.width.equalTo(@50.f);
                make.height.equalTo(@50.f);
            }];
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor orangeColor];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [imageButton addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0.f);
                make.left.equalTo(@0.f);
                
                make.width.equalTo(@50.f);
                make.height.equalTo(@50.f);
            }];
        }
        
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
        [bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@(-50.f));
            make.centerX.equalTo(bgView.mas_centerX);
            
            make.width.equalTo(bgView.mas_width);
            make.height.equalTo(@1.f);
        }];
        
        UIButton * lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        lookButton.tag = 1000;
        lookButton.frame = CGRectMake(0.f, bgView.frame.size.height-50.f, bgView.frame.size.width/2-0.5, 50.f);
        lookButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [lookButton setTitle:@"站内信" forState:UIControlStateNormal];
        [lookButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [lookButton addTarget:self action:@selector(weChatButtonWithClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:lookButton];
        
        UIView * lineCenterView = [[UIView alloc] init];
        lineCenterView.alpha = 0.4;
        lineCenterView.backgroundColor = [UIColor grayColor];
        [bgView addSubview:lineCenterView];
        [lineCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0.f);
            make.centerX.equalTo(bgView.mas_centerX);
            
            make.width.equalTo(@1.f);
            make.height.equalTo(@50.f);
        }];
        
        UIButton * deterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        deterButton.tag = 1001;
        deterButton.frame = CGRectMake(bgView.frame.size.width/2+0.5, bgView.frame.size.height-50.f, bgView.frame.size.width/2-0.5, 50.f);
        deterButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [deterButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [deterButton setTitle:@"确认" forState:UIControlStateNormal];
        [deterButton addTarget:self action:@selector(weChatButtonWithClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:deterButton];
    }
    
    return self;
}

#pragma mark -- urlButton
- (void)urlButtonClick:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sender.currentTitle]];
}

#pragma mark -- imageButton
- (void)imageButtonClick:(UIButton *)sender {
    NSLog(@"放大图片");
}

#pragma mark -- tap
- (void)tapGestureClick:(UIGestureRecognizer *)tap {
    [self weChatButtonWithClick:nil];
}

- (void)weChatButtonWithClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
