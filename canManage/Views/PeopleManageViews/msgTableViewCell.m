//
//  msgTableViewCell.m
//  canManage
//
//  Created by MAX-TECH on 15/8/5.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "msgTableViewCell.h"

@implementation msgTableViewCell

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
    CGRect flagFrame = CGRectMake(8, 8, 35, 31);
    self.flag.frame =flagFrame;
    
    //重新设置image的frame
    CGRect typeFrame = CGRectMake(51, 8, 58, 31);
    self.flag.frame =typeFrame;
    
    
    
}
@end
