//
//  reportViewController.m
//  canManage
//
//  Created by MAX-TECH on 15/7/15.
//  Copyright (c) 2015年 com.max-tech.com.cn. All rights reserved.
//

#import "reportViewController.h"

@interface reportViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation reportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报表";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.testWeb= [[UIWebView alloc] initWithFrame:self.view.frame];
//    [self.testWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.rionsoft.com/"]]];
    
    UIWebView *webView = [[UIWebView alloc] init];
    self.webView = webView;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.rionsoft.com/"]]];

    
    // Do any additional setup after loading the view.
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
