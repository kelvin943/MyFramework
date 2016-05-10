//
//  leaveTableCell.h
//  canManage
//
//  Created by MAX-TECH on 15/8/3.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface leaveTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (strong, nonatomic) IBOutlet UILabel *endTime;
@property (strong, nonatomic) IBOutlet UIImageView *leaveType;

@end
