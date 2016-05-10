//
//  PMHeadView.m
//  canManage
//
//  Created by MAX-TECH on 15/7/16.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "PMHeadView.h"

@implementation PMHeadView
{
    UIButton *_arrowBtn;
    UIView * _lineView;
//    UILabel *_label;
}

+ (instancetype)headerView:(UITableView *)tableView{
    static NSString *identifier = @"PMheader";
    PMHeadView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[PMHeadView alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //创建Button 点击 展开收缩cell
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.clipsToBounds = NO;
       
        _arrowBtn = button;
        [self addSubview:_arrowBtn];
//        //创建label，显示标题
//        UILabel *labelRight = [[UILabel alloc] init];
//        labelRight.textAlignment = NSTextAlignmentCenter;
//        _label = labelRight;
//        [self addSubview:_label];
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor blackColor];
        _lineView =lineView;
        [self addSubview:_lineView];
    }
    return self;
}

#pragma mark - buttonAction
- (void)buttonAction{
    self.PMModel.isOpen = !self.PMModel.isOpen;
    [self transformImageView];
    if ([self.delegate respondsToSelector:@selector(clickView:)]) {
        [self.delegate clickView:self.headIndex];
    }
}

- (void) transformImageView
{
    _arrowBtn.imageView.transform = self.PMModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) :CGAffineTransformMakeRotation(0);
}
#pragma mark [tableview reloadData] 时调用
//旋转三角形
- (void)didMoveToSuperview{
    _arrowBtn.imageView.transform = self.PMModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) :CGAffineTransformMakeRotation(0);
}

//button布局
- (void)layoutSubviews{
    [super layoutSubviews];
    _arrowBtn.frame = self.bounds;
    
    _lineView.frame = CGRectMake(0, 44, self.bounds.size.width, 1);
//    _label.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}

//模型赋值
- (void) setPMModel:(PMHeadViewModel *)PMModel
{
    _PMModel =PMModel;
    [_arrowBtn setTitle:self.PMModel.title forState:UIControlStateNormal];
}
@end
