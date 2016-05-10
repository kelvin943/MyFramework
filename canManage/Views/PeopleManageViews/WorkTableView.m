//
//  WorkTableView.m
//  canManage
//
//  Created by MAX-TECH on 15/7/31.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "WorkTableView.h"
#import "PMTitleViewCell.h"

@implementation WorkTableView

+ (instancetype) makeWorkTableView{
    return [[[NSBundle mainBundle]loadNibNamed:@"WorkTableView" owner:self options:nil]firstObject];
}

- (IBAction)lastBtn:(id)sender {
}
- (IBAction)nextBtn:(id)sender {
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //+1 表示添加一个空白的头视图
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
//绘制cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = [indexPath row];
    if (row == 0) {
        static NSString *identy = @"PMTitleViewCell";
        UINib* nib = [UINib nibWithNibName:@"PMTitleViewCell" bundle:nil];
        //注册nib
        if (![nibArray containsObject:nib]) {
            [tableView registerNib:nib forCellReuseIdentifier:identy];
            [nibArray  addObject:nib];
        }
        PMTitleViewCell *titleCell = [tableView dequeueReusableCellWithIdentifier:identy];
        titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return titleCell;
        
    }
    else{
        static NSString *identifier = @"WorkStateCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
            
        }
//        PMHeadViewModel *currentModel = self.dataArray[indexPath.section];
//        leaveAutoModel *leaveModel =currentModel.sourceArray[indexPath.row - 1];
        cell.textLabel.text = @"张三";
        return cell;
    }
    
}

@end
