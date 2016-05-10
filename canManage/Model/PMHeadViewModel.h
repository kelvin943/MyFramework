//
//  PMHeadViewModel.h
//  canManage
//
//  Created by MAX-TECH on 15/7/16.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMHeadViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) NSArray *sourceArray;


@end
