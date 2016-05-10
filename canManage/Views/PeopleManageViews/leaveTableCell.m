//
//  leaveTableCell.m
//  canManage
//
//  Created by MAX-TECH on 15/8/3.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "leaveTableCell.h"

@implementation leaveTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) layoutSubviews{
    [super layoutSubviews];
    BOOL contentViewIsAutoresized =CGSizeEqualToSize(self.frame.size,self.contentView.frame.size );
    
    if (!contentViewIsAutoresized) {
        CGRect contentViewFrame = self.contentView.frame;
        contentViewFrame.size = self.frame.size;
        self.contentView.frame = contentViewFrame;
    }
    //重新设置image的frame
    CGRect imageFrame = CGRectMake(250, 8, 55, 27);
    self.imageView.frame =imageFrame;
    
}

@end
