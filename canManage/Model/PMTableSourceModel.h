//
//  PMTableSourceModel.h
//  canManage
//
//  Created by MAX-TECH on 15/7/31.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, leaveType) {
    leaveBj,
    leaveNj,
    leaveHy
};

typedef NS_ENUM(NSInteger, msgFlag) {
    msgNotice,
    msgWarn
};

typedef NS_ENUM(NSInteger, msgType) {
    msgImportant,
    msgAlert,
    msgEmergency
};

@class UIImage;
@interface leaveAutoModel : NSObject  //<NSCoding>

//@property(nonatomic,strong)NSString *address;
//@property(nonatomic,assign)int storeId;
//@property(nonatomic,strong)NSString *name;
//@property(nonatomic,strong)NSString *code;
//@property(nonatomic,assign)int isSpecial;
//@property(nonatomic,assign)float lat;
//@property(nonatomic,assign)float lng;
//@property(nonatomic,assign)int sub;
//@property(nonatomic,assign)int isEnter;
//@property(nonatomic,assign)int visitPlanId;
//@property(nonatomic,strong)NSMutableArray *List;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSString *startTime;
@property (nonatomic,strong) NSString *endTime;
@property (nonatomic,assign) leaveType leaveType;
@end


@interface messageModel : NSObject
@property (nonatomic,strong) NSString *msgId;
@property (nonatomic,assign) msgFlag msgFlag;
@property (nonatomic,assign) msgType msgType;
@property (nonatomic,strong) NSString *msgTitle;
@end

@interface workStatusModel : NSObject
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *signIn;
@property (nonatomic,strong) NSString *planCount;
@property (nonatomic,strong) NSString *realCount;
@property (nonatomic,strong) NSString *signOut;
@property (nonatomic,strong) NSString *status;
@end
