//
//  HandleTableView.h
//  canManage
//
//  Created by MAX-TECH on 15/7/27.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "PMHeadView.h"

@interface HandleTableView : UIView<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate,HeaderViewDelegate>

{
    EGORefreshTableHeaderView *_refreshHeaderView;
    NSInteger     mRowCount;
    NSMutableArray * nibArray;
}

@property (nonatomic,assign) BOOL reloading;
@property (nonatomic,retain) UITableView *homeTableView;
@property (nonatomic, strong) NSArray *dataArray;

#pragma mark 强制列表刷新
-(void)forceToFreshData;
@end
