//
//  PhotoTableViewCell.m
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/17.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PhotoTableViewCell.h"

@implementation PhotoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.photoTitleLable = [[UILabel alloc] init];
        self.photoTitleLable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.photoTitleLable];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_photoTitleLable]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_photoTitleLable)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_photoTitleLable(25)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_photoTitleLable)]];
        self.photoDateLable = [[UILabel alloc] init];
        self.photoDateLable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.photoDateLable];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_photoDateLable]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_photoDateLable)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_photoTitleLable]-25-[_photoDateLable(25)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_photoTitleLable,_photoDateLable)]];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.photoTitleLable.shadowColor = [UIColor darkGrayColor];
        self.photoTitleLable.shadowOffset = CGSizeMake(3.f, 3.f);
    } else {
        self.photoTitleLable.shadowColor = nil;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
