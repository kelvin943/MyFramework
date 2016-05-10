//
//  HandleTableView.m
//  canManage
//
//  Created by MAX-TECH on 15/7/27.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "HandleTableView.h"
#import "PMHeadView.h"
#import "EGORefreshTableHeaderView.h"
#import "PMTableSourceModel.h"
#import "PMTitleViewCell.h"
#import "TitleViewCell4.h"
#import "leaveTableCell.h"
#import "msgTableViewCell.h"

@implementation HandleTableView

//懒加载数据源
- (NSArray *)dataArray{
    if (!_dataArray) {
        NSMutableArray *muArray = [[NSMutableArray alloc] init];
        PMHeadViewModel * PMModel = [[PMHeadViewModel alloc] init];
        PMModel.isOpen = YES;
        PMModel.title = @"请假审批";
        //请假审批数据源
//        PMModel.sourceArray =@[@"11",@"22",@"33"];
        NSMutableArray *leaveSourArray = [[NSMutableArray alloc] init];
        //手动添加数据源
        leaveAutoModel * leave1 = [[leaveAutoModel alloc] init];
        leave1.userId = @"1";
        leave1.userName = @"张三";
        leave1.startTime = @"20150507";
        leave1.endTime = @"20150507";
        leave1.leaveType = 0;
        [leaveSourArray  addObject:leave1];
        leaveAutoModel * leave2 = [[leaveAutoModel alloc] init];
        leave2.userId = @"2";
        leave2.userName = @"李四";
        leave2.startTime = @"20150505";
        leave2.endTime = @"20150506";
        leave2.leaveType = 1;
        [leaveSourArray  addObject:leave2];
        
        leaveAutoModel * leave3 = [[leaveAutoModel alloc] init];
        leave3.userId = @"3";
        leave3.userName = @"陈房";
        leave3.startTime = @"20150505";
        leave3.endTime = @"20150506";
        leave3.leaveType = 2;
        [leaveSourArray  addObject:leave3];
        PMModel.sourceArray =[leaveSourArray copy];
        [leaveSourArray removeAllObjects];
        [muArray addObject:PMModel];
        
        
        
        
        PMHeadViewModel * PMModel1 = [[PMHeadViewModel alloc] init];
        PMModel1.isOpen = YES;
        PMModel1.title = @"未读消息";
        //未读消息数据源
//        PMModel1.sourceArray =@[@"11",@"22",@"33",@"44",@"55"];
        messageModel *msgModel = [[messageModel alloc] init];
        msgModel.msgFlag =0;
        msgModel.msgTitle = @"Can1系统合并通知";
        msgModel.msgType = 0;
        [leaveSourArray addObject:msgModel];
        messageModel *msgModel1 = [[messageModel alloc] init];
        msgModel1.msgFlag = 0;
        msgModel1.msgTitle = @"Can2系统合并通知";
        msgModel1.msgType = 1;
        [leaveSourArray addObject:msgModel1];
        
        messageModel *msgModel2 = [[messageModel alloc] init];
        msgModel2.msgFlag = 0;
        msgModel2.msgTitle = @"Can3系统合并通知";
        msgModel2.msgType = 2;
        [leaveSourArray addObject:msgModel2];
        
        messageModel *msgModel3 = [[messageModel alloc] init];
        msgModel3.msgFlag = 1;
        msgModel3.msgTitle = @"张三1迟到考勤回复";
        msgModel3.msgType = 0;
        [leaveSourArray addObject:msgModel3];
        
        messageModel *msgModel4 = [[messageModel alloc] init];
        msgModel4.msgFlag = 1;
        msgModel4.msgTitle = @"张三2迟到考勤回复";
        msgModel4.msgType = 1;
        [leaveSourArray addObject:msgModel4];
        
        messageModel *msgModel5 = [[messageModel alloc] init];
        msgModel5.msgFlag = 1;
        msgModel5.msgTitle = @"张三2迟到考勤回复";
        msgModel5.msgType = 2;
        [leaveSourArray addObject:msgModel5];
        
        PMModel1.sourceArray =[leaveSourArray copy];
        [muArray addObject:PMModel1];
        _dataArray = [muArray copy];
        
    }
    return _dataArray;
}

- (id) initWithFrame:(CGRect)frame{
   
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化表视图
        if (_homeTableView == nil) {
            _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            _homeTableView.delegate = self;
            _homeTableView.dataSource = self;
            //表视图的背景色一定要为透明色下拉刷新视图才会显示
            [_homeTableView setBackgroundColor:[UIColor clearColor]];
        }
        [self addSubview:_homeTableView];
        
        //初始化自定义下拉刷新视图
        if (_refreshHeaderView == nil) {
            
            EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:_homeTableView.frame];
            view.delegate = self;
            [self insertSubview:view belowSubview:_homeTableView];
            _refreshHeaderView = view;
        }
        //  update the last update date
        [_refreshHeaderView refreshLastUpdatedDate];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


#pragma mark 其他辅助功能
#pragma mark 强制列表刷新
-(void)forceToFreshData{
    [_homeTableView setContentOffset:CGPointMake(_homeTableView.contentOffset.x,  - 66) animated:YES];
    double delayInSeconds = .2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_refreshHeaderView forceToRefresh:_homeTableView];
    });
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
//刷新表数据的请求
- (void)reloadTableViewDataSource{
    _reloading = YES;
    
    //刷新表数据重新请求后台获得数据
    NSMutableArray *leaveSourArray = [[NSMutableArray alloc] init];
    //手动添加数据源
    leaveAutoModel * leave1 = [[leaveAutoModel alloc] init];
    leave1.userId = @"1";
    leave1.userName = @"张三";
    leave1.startTime = @"20150507";
    leave1.endTime = @"20150507";
    leave1.leaveType = 1;
    [leaveSourArray  addObject:leave1];
    leaveAutoModel * leave2 = [[leaveAutoModel alloc] init];
    leave2.userId = @"2";
    leave2.userName = @"李四";
    leave2.startTime = @"20150505";
    leave2.endTime = @"20150506";
    leave2.leaveType = 2;
    [leaveSourArray  addObject:leave2];
    leaveAutoModel * leave3 = [[leaveAutoModel alloc] init];
    leave3.userId = @"3";
    leave3.userName = @"王五";
    leave3.startTime = @"20150505";
    leave3.endTime = @"20150506";
    leave3.leaveType = 3;
    [leaveSourArray  addObject:leave3];
     PMHeadViewModel * temp =[self.dataArray objectAtIndex:0];
    temp.sourceArray =[leaveSourArray copy];
    
    
    [leaveSourArray removeAllObjects];
    messageModel *msgModel = [[messageModel alloc] init];
    msgModel.msgFlag = 1;
    msgModel.msgTitle = @"Can系统合并通知";
    msgModel.msgType = 1;
    [leaveSourArray addObject:msgModel];
    messageModel *msgModel1 = [[messageModel alloc] init];
    msgModel1.msgFlag = 1;
    msgModel1.msgTitle = @"张三迟到考勤回复";
    msgModel1.msgType = 2;
    [leaveSourArray addObject:msgModel1];
    messageModel *msgModel2 = [[messageModel alloc] init];
    msgModel2.msgFlag =2;
    msgModel2.msgTitle = @"系统回复正常通知";
    msgModel2.msgType = 3;
    [leaveSourArray addObject:msgModel2];
    PMHeadViewModel * temp1 =[self.dataArray objectAtIndex:1];
    temp1.sourceArray =[leaveSourArray copy];
    
    
    
    
    
    
    
    
}

- (void)doneLoadingTableViewData{
    
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.homeTableView];
    [self.homeTableView reloadData];
    
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [_refreshHeaderView egoRefreshScrollViewWillBeginScroll:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    
    [self reloadTableViewDataSource];
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
    
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return _reloading; // should return if data source model is reloading
    
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
    
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //+1 表示添加一个空白的头视图
    return self.dataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        PMHeadViewModel * PMmodel = self.dataArray[section];
        return PMmodel.sourceArray.count + 1;
    }
    else if (section == self.dataArray.count){
        return 0;
    }
    else
    {
        PMHeadViewModel * PMmodel = self.dataArray[section];
        return PMmodel.sourceArray.count;
    }
   

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    PMHeadViewModel * PMModel = self.dataArray[indexPath.section];
    if (PMModel.isOpen) {
        return 40;
    }
    else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == self.dataArray.count) {
        return 500;
    }
    else    {
        return 45;
    }
    
}

//绘制cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = [indexPath row];
    //请假审批
    if (indexPath.section  == 0) {
        if (row == 0) {
            static NSString *identy = @"TitleViewCell4";
            UINib* nib = [UINib nibWithNibName:@"TitleViewCell4" bundle:nil];
            //注册nib
            if (![nibArray containsObject:nib]) {
                [tableView registerNib:nib forCellReuseIdentifier:identy];
                [nibArray  addObject:nib];
            }
            TitleViewCell4 *titleCell = [tableView dequeueReusableCellWithIdentifier:identy];
            titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
            titleCell.lab1.text= @"姓名";
            titleCell.lab2.text= @"开始";
            titleCell.lab3.text= @"结束";
            titleCell.lab4.text= @"类型";
            return titleCell; 
        }
        else{
            static NSString *identifier = @"leaveTableCell";
            UINib *nib = [UINib nibWithNibName:@"leaveTableCell" bundle:nil];
            //注册NIB
            if (![nibArray containsObject:nib]) {
                [tableView registerNib:nib forCellReuseIdentifier:identifier];
                [nibArray addObject:nib];
            }
            leaveTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            PMHeadViewModel *currentModel = self.dataArray[indexPath.section];
            leaveAutoModel *leaveModel =currentModel.sourceArray[indexPath.row - 1];
            cell.userName.text =leaveModel.userName;
            cell.startTime.text=leaveModel.startTime;
            cell.endTime.text =leaveModel.endTime;
            
            switch (leaveModel.leaveType) {
                case leaveBj :
                    cell.imageView.image = [UIImage imageNamed:@"1_1_bj"];
                    break;
                 case leaveNj :
                    cell.imageView.image = [UIImage imageNamed:@"1_2_nj"];
                    break;
                case leaveHy :
                    cell.imageView.image = [UIImage imageNamed:@"1_3_hy"];
                    break;
            }   
            return cell;
        }

    }
    else //未读消息
    {
        static NSString *identifier = @"msgTableViewCell";
        UINib *nib = [UINib nibWithNibName:@"msgTableViewCell" bundle:nil];
        //注册NIB
        if (![nibArray containsObject:nib]) {
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            [nibArray addObject:nib];
        }
        msgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        PMHeadViewModel *currentModel = self.dataArray[indexPath.section];
        messageModel *msgModel =currentModel.sourceArray[indexPath.row];
        switch (msgModel.msgFlag) {
            case msgWarn :
                cell.flag.image = [UIImage imageNamed:@"1_7_alt"];
                break;
            case msgNotice :
                cell.flag.image = [UIImage imageNamed:@"1_8_msg"];
                break;
        }
        
        switch (msgModel.msgType) {
            case msgImportant :
                cell.type.image = [UIImage imageNamed:@"1_4_zy"];
                break;
            case msgAlert :
                cell.type.image = [UIImage imageNamed:@"1_5_jg"];
                break;
            case msgEmergency :
                cell.type.image = [UIImage imageNamed:@"1_6_jj"];
                break;
            
        }
        cell.title.text =msgModel.msgTitle;
        NSLog(@"flag%@",NSStringFromCGRect(cell.flag.frame) );
        NSLog(@"flag%@",NSStringFromCGRect(cell.type.frame) );
  
        return cell;
        
    }
    
}

#pragma mark -
#pragma mark UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == self.dataArray.count) {
        UIView *blankHeaderview = [[UIView alloc] init];
        blankHeaderview.backgroundColor = [UIColor whiteColor];
        return blankHeaderview;
    }
    else{
        PMHeadView *header = [PMHeadView headerView:tableView];
        header.delegate = self;
        header.headIndex = (int)section;
        header.PMModel =  self.dataArray[section];
        return header;
        
    }
}

#pragma mark -
#pragma mark HeaderViewDelegate
- (void)clickView:(int) headIndex{
    //点击头视图时收缩和展开的动画
    PMHeadViewModel * currentModel = self.dataArray[headIndex];
    
    //获得当前section 中有多少行
    int rowCount;
    if (headIndex ==0) {
        rowCount =(int)currentModel.sourceArray.count + 1;
    }
    else
    {
        rowCount =(int)currentModel.sourceArray.count;
    }
    //收缩
    if (!currentModel.isOpen) {
        NSMutableArray * indexArray = [[NSMutableArray alloc] init];
        @autoreleasepool {
            for (int i=0; i < rowCount; i++) {
                NSIndexPath *temPath = [NSIndexPath indexPathForRow:i inSection:headIndex];
                [indexArray addObject:temPath];
            }
        }
        [UIView animateWithDuration:0.5 animations:^{
            for (NSIndexPath *tmp  in indexArray) {
                [self.homeTableView cellForRowAtIndexPath:tmp].alpha =0.0f;
            }
        } completion:^(BOOL finished) {
            for (NSIndexPath *tmp1 in indexArray) {
                [[self.homeTableView cellForRowAtIndexPath:tmp1] setHidden:YES];
            }
            [self.homeTableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
            
        }];
    }
    //展开
    else    {
        NSMutableArray * indexArray = [[NSMutableArray alloc] init];
        @autoreleasepool {
            for (int i=0; i < rowCount; i++) {
                NSIndexPath *temPath = [NSIndexPath indexPathForRow:i inSection:headIndex];
                [indexArray addObject:temPath];
            }
        }
        [UIView animateWithDuration:0.5 animations:^{
            for (NSIndexPath *tmp  in indexArray) {
                [self.homeTableView cellForRowAtIndexPath:tmp].alpha =1.0f;
            }
        } completion:^(BOOL finished) {
            for (NSIndexPath *tmp1 in indexArray) {
                [[self.homeTableView cellForRowAtIndexPath:tmp1] setHidden:YES];
            }
            [self.homeTableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
            
        }];
    }
    //   [self.handleTableView reloadData];
}

#pragma mark -
#pragma mark 去掉多余的线
- (void)clipExtraCellLine:(UITableView *)tableView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.homeTableView setTableFooterView:view];
}
@end
