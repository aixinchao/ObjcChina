//
//  PhotoTableViewCell+ConfigureForPhoto.m
//  PhotoDataTest
//
//  Created by Taskmall on 16/2/24.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "PhotoTableViewCell+ConfigureForPhoto.h"

@implementation PhotoTableViewCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo {
    self.photoTitleLable.text = photo.name;
    self.photoDateLable.text = [self.dateFormatter stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter * dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

@end
