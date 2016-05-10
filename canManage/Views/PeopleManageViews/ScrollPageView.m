//
//  ScrollPageView.m
//  ShowProduct
//
//  Created by lin on 14-5-23.
//  Copyright (c) 2014年 @"". All rights reserved.
//

#import "AppDelegate.h"
#import "ScrollPageView.h"
#import "HandleTableView.h"
#import "WorkTableView.h"

@implementation ScrollPageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        mNeedUseDelegate = YES;
        [self commInit];
    }
    return self;
}

-(void)initData{
    [self freshContentTableAtIndex:0];
}


-(void)commInit{
    if (_contentItems == nil) {
        _contentItems = [[NSMutableArray alloc] init];
    }
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        NSLog(@"ScrollViewFrame:(%f,%f)",self.frame.size.width,self.frame.size.height);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    
    }
    [self addSubview:_scrollView];
}


#pragma mark - 其他辅助功能
#pragma mark 添加ScrollowViewd的ContentView
-(void)setContentOfTables:(NSInteger)aNumerOfTables{
//    for (int i = 0; i < aNumerOfTables; i++) {
//        HandleTableView *vCustomTableView = [[HandleTableView alloc] initWithFrame:CGRectMake( self.frame.size.width* i, 0, self.frame.size.width, self.frame.size.height)];
//        [_scrollView addSubview:vCustomTableView];
//        [_contentItems addObject:vCustomTableView];
//    }
    HandleTableView *vCustomTableView = [[HandleTableView alloc] initWithFrame:CGRectMake( self.frame.size.width* 0, 0, self.frame.size.width, self.frame.size.height)];
    [_scrollView addSubview:vCustomTableView];
    [_contentItems addObject:vCustomTableView];
    
//    WorkTableView *WorkTableView = [[WorkTableView alloc] initWithFrame:CGRectMake( self.frame.size.width* 1, 0, self.frame.size.width, self.frame.size.height)];
    WorkTableView *WTView = [WorkTableView makeWorkTableView];
    WTView.frame =CGRectMake( self.frame.size.width* 1, 0, self.frame.size.width, self.frame.size.height);


    [_scrollView addSubview:WTView];
    [_contentItems addObject:WTView];
    
    
    [_scrollView setContentSize:CGSizeMake(self.frame.size.width * aNumerOfTables, self.frame.size.height)];
}

#pragma mark 移动ScrollView到某个页面
-(void)moveScrollowViewAthIndex:(NSInteger)aIndex{
    mNeedUseDelegate = NO;
    CGRect vMoveRect = CGRectMake(self.frame.size.width * aIndex, 0, self.frame.size.width, self.frame.size.width);
    [_scrollView scrollRectToVisible:vMoveRect animated:YES];
    mCurrentPage= aIndex;
    if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)]) {
        [_delegate didScrollPageViewChangedPage:mCurrentPage];
    }
}

#pragma mark 刷新某个页面
-(void)freshContentTableAtIndex:(NSInteger)aIndex{
    if (_contentItems.count < aIndex) {
        return;
    }
    HandleTableView * vTableContentView =(HandleTableView *)[_contentItems objectAtIndex:aIndex];
    [vTableContentView forceToFreshData];
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    mNeedUseDelegate = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (_scrollView.contentOffset.x+self.frame.size.width/2.0) / self.frame.size.width;
    if (mCurrentPage == page) {
        return;
    }
    mCurrentPage= page;
    if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)] && mNeedUseDelegate) {
        [_delegate didScrollPageViewChangedPage:mCurrentPage];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
//        CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
//        targetX = (int)(targetX/ITEM_WIDTH) * ITEM_WIDTH;
//        [self moveToTargetPosition:targetX];
    }
  

}

//-(void)loadData:(void(^)(int aAddedRowCount))complete FromView:(CustomTableView *)aView{
//    //    double delayInSeconds = 1.0;
//    //    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    //    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//    for (int i = 0; i < 4; i++) {
//        [aView.tableInfoArray  addObject:@"0"];
//    }
//    if (complete) {
//        complete(4);
//    }
//    //    });
//}
//
//-(void)refreshData:(void(^)())complete FromView:(CustomTableView *)aView{
//    double delayInSeconds = 1.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [aView.tableInfoArray removeAllObjects];
//        for (int i = 0; i < 4; i++) {
//            [aView.tableInfoArray addObject:@"0"];
//        }
//        //改变header显示图片
//        [self changeHeaderContentWithCustomTable:aView];
//        if (complete) {
//            complete();
//        }
//    });
//}
//
//- (BOOL)tableViewEgoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view FromView:(CustomTableView *)aView{
//   return  aView.reloading;
//}


@end
