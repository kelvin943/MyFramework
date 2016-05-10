//
//  peopleManageViewController.h
//  canManage
//
//  Created by MAX-TECH on 15/7/15.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "ScrollPageView.h"

@interface peopleManageViewController : UIViewController<ScrollPageViewDelegate>
{
    ScrollPageView    *mScrollPageView;
    NSMutableArray        *mButtonArray;

}
@end
