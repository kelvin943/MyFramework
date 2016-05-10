//
//  WorkTableView.h
//  canManage
//
//  Created by MAX-TECH on 15/7/31.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkTableView : UIView
{
      NSMutableArray * nibArray;
}
@property (strong, nonatomic) IBOutlet UILabel *MonthLable;
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

+ (instancetype) makeWorkTableView;
@end
