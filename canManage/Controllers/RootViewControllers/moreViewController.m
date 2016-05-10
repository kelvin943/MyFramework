//
//  moreViewController.m
//  canManage
//
//  Created by MAX-TECH on 15/7/15.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "moreViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface moreViewController ()

@end

@implementation moreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.title = @"更多";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) validateToutchID
{
    LAContext * context = [[LAContext alloc] init];
    NSError * error;
    NSString * string = @"通过Home键验证指纹识别";
    
    //判断手机是否有指纹
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:string reply:^(BOOL success, NSError *error) {
            if (success) {
                NSLog(@"SUCCESS");
                
            }
            else{
                NSLog(@"%@",error.description);
                switch (error.code) {
                    case LAErrorSystemCancel:
                        NSLog(@"系统取消授权");
                        break;
                    case LAErrorUserCancel:
                        NSLog(@"用户取消授权");
                        break;
                    case LAErrorUserFallback:
                        NSLog(@"用户输入密码");
                        break;
                    default:
                        break;
                }
            }
            
        }];
    }
    else
    {
        NSLog(@"不支持指纹识别的手机，%@",error.description);
    }
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
