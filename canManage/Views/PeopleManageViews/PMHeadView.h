//
//  PMHeadView.h
//  canManage
//
//  Created by MAX-TECH on 15/7/16.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMHeadViewModel.h"

//自定义头视图的协议（点击时收缩展开）
@protocol HeaderViewDelegate <NSObject>

@optional
- (void)clickView: (int) headIndex;
@end

@interface PMHeadView : UITableViewHeaderFooterView

@property (nonatomic, assign) id<HeaderViewDelegate> delegate;

@property (nonatomic, strong) PMHeadViewModel *PMModel;
@property int headIndex;
+ (instancetype)headerView:(UITableView *)tableView;

@end
