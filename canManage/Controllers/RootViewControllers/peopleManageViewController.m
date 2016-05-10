//
//  peopleManageViewController.m
//  canManage
//
//  Created by MAX-TECH on 15/7/15.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "AppDelegate.h"
#import "peopleManageViewController.h"

#define NOMALKEY   @"normalKey"
#define HEIGHTKEY  @"helightKey"
#define TITLEKEY   @"titleKey"
#define TITLEWIDTH @"titleWidth"
#define TOTALWIDTH @"totalWidth"

@interface peopleManageViewController ()
@end

@implementation peopleManageViewController

//懒加载数据源
//- (NSArray *)dataArray{
//    if (!_dataArray) {
////        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
////        NSArray *array = [NSArray arrayWithContentsOfFile:path];
////        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
////        for (NSDictionary *dict in array) {
////            JKGroupModel *groupModel = [JKGroupModel GroupWithDict:dict];
////            [muArray addObject:groupModel];
////        }
////             _dataArray = [muArray copy];
//        NSMutableArray *muArray = [[NSMutableArray alloc] init];
//        PMHeadViewModel * PMModel = [[PMHeadViewModel alloc] init];
//        PMModel.isOpen = YES;
//        PMModel.title = @"请假审批";
//        PMModel.sourceArray =@[@"11",@"22",@"33"];
//        [muArray addObject:PMModel];
//        PMHeadViewModel * PMModel1 = [[PMHeadViewModel alloc] init];
//        PMModel1.isOpen = YES;
//        PMModel1.title = @"未读消息";
//        PMModel1.sourceArray =@[@"11",@"22",@"33",@"44",@"55"];
//        [muArray addObject:PMModel1];
//        _dataArray = [muArray copy];
//
//    }
//    return _dataArray;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"人员管理";
    self.navigationController.tabBarItem.title =@"人员";
    [self initControl];
    //默认选中请假申请模块
    [self clickButtonAtIndex:0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-
#pragma mark 界面初始化

- (void) initControl{
    
    //初始化滑动列表
    if (mScrollPageView == nil) {
        mScrollPageView = [[ScrollPageView alloc] initWithFrame:CGRectMake(0, 94, kScreenWidth, kScreenHeight-94)];
        mScrollPageView.delegate = self;
    }
    [mScrollPageView setContentOfTables:2];
    [self.view addSubview:mScrollPageView];
    
    //初始化自定义滑块控件
    NSArray *vButtonItemArray = @[@{NOMALKEY: @"normal.png",
                                    HEIGHTKEY:@"helight.png",
                                    TITLEKEY:@"请假申请",
                                    TITLEWIDTH:[NSNumber numberWithFloat:kScreenWidth/2]
                                    },
                                  @{NOMALKEY: @"normal.png",
                                    HEIGHTKEY:@"helight.png",
                                    TITLEKEY:@"工作状况",
                                    TITLEWIDTH:[NSNumber numberWithFloat:kScreenWidth/2]
                                    }];
    
    if (mButtonArray == nil) {
        mButtonArray = [[NSMutableArray alloc] init];
    }
    
    int i=0;
    float menuWidth = 0.0;
    for (NSDictionary *lDic in vButtonItemArray) {
        NSString *vNormalImageStr = [lDic objectForKey:NOMALKEY];
        NSString *vHeligtImageStr = [lDic objectForKey:HEIGHTKEY];
        NSString *vTitleStr = [lDic objectForKey:TITLEKEY];
        float vButtonWidth = [[lDic objectForKey:TITLEWIDTH] floatValue];
        UIButton *vButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [vButton setBackgroundImage:[UIImage imageNamed:vNormalImageStr] forState:UIControlStateNormal];
        [vButton setBackgroundImage:[UIImage imageNamed:vHeligtImageStr] forState:UIControlStateSelected];
        [vButton setTitle:vTitleStr forState:UIControlStateNormal];
        [vButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [vButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [vButton setTag:i];
        [vButton addTarget:self action:@selector(menuButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [vButton setFrame:CGRectMake(menuWidth, 64, vButtonWidth, 30)];
        [mButtonArray addObject:vButton];
        menuWidth += vButtonWidth;
        i++;
        [self.view  addSubview:vButton];
    }
    
    
}


#pragma mark-
#pragma mark 按钮事件
- (void)menuButtonClicked:(UIButton *)aButton {
    
    for (UIButton *vButton in mButtonArray) {
        vButton.selected = NO;
    }
    aButton.selected = YES;
    [mScrollPageView moveScrollowViewAthIndex:aButton.tag];
}

#pragma mark 模拟选中第几个button
-(void)clickButtonAtIndex:(NSInteger)aIndex{
    UIButton *vButton = [mButtonArray objectAtIndex:aIndex];
    [self menuButtonClicked:vButton];
}


#pragma mark 改变第几个button为选中状态，scrollView滑动的时候调用
-(void)changeButtonStateAtIndex:(NSInteger)aIndex{
    UIButton *aButton = [mButtonArray objectAtIndex:aIndex];
    for (UIButton *vButton in mButtonArray) {
        vButton.selected = NO;
    }
    aButton.selected = YES;
    
}

#pragma mark -
#pragma mark ScrollPageViewDelegate

-(void)didScrollPageViewChangedPage:(NSInteger)aPage{
    NSLog(@"CurrentPage:%ld",(long)aPage);
    //刷新当页数据
    [self changeButtonStateAtIndex:aPage];
    //scrollView 滑动的时候自定刷新表视图
    //    [mScrollPageView freshContentTableAtIndex:aPage];
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
