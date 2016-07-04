//
//  ViewController.m
//  LDZMoviewPlayer_Xib
//
//  Created by rongxun02 on 15/11/24.
//  Copyright © 2015年 DongZe. All rights reserved.
//

#import "ViewController.h"
#import "LDZMoviePlayerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)pushVC{
    LDZMoviePlayerController *moviewPlayerVC = [[LDZMoviePlayerController alloc] init];
    
    /*
     //  播放本地
     moviewPlayerVC.movieURL = [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"5540385469401b10912f7a24-6.mp4"]];
     */
    //  播放网络
    NSString *urlString = @"http://mw5.dwstatic.com/2/4/1529/134981-99-1436844583.mp4";
    NSURL *URL = [NSURL URLWithString: urlString];
    moviewPlayerVC.movieURL = URL;
    [self.navigationController pushViewController:moviewPlayerVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com