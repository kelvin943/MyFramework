//
//  RootViewController.m
//  canManage
//
//  Created by MAX-TECH on 15/7/15.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#include "AppDelegate.h"
#import "RootViewController.h"

CGFloat const tabViewHeight = 49;

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewAndBackgroundColors];

}


- (void) initViewAndBackgroundColors
{
    //加载工具栏分割线
    self.tabBarSeparateLineView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-tabViewHeight -1, kScreenWidth, 1)];
    self.tabBarSeparateLineView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.tabBarSeparateLineView];
    //初始化导航控制器颜色
    for (UINavigationController * navCtrl in self.viewControllers) {
        navCtrl.navigationBar.backgroundColor = UIColorFromRGB(0x067AB5);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
