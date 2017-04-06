//
//  ViewController.m
//  YLSpringHeader
//
//  Created by iceMaple on 2017/3/27.
//  Copyright © 2017年 yongliangP. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+YLSpringHeader.h"
#import "YLSpringHeaderView.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) YLSpringHeaderView *headerView;


@end

@implementation ViewController


-(void)dealloc
{
    [self.webView.scrollView removeObserver:self.webView.scrollView forKeyPath:@"contentOffset"];
    NSLog(@"释放监听者");
}


#pragma mark - Getter

-(YLSpringHeaderView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[YLSpringHeaderView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowWidth/2)];
        [self.view addSubview:_headerView];
    }

    return _headerView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowHeight)];
    self.webView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.webView];
    
    NSURL * url = [NSURL URLWithString:@"https://yongliangp.github.io/"];
    NSMutableURLRequest *re = [NSMutableURLRequest requestWithURL:url];
    [self.webView loadRequest:re];
    
    //初始化header
    self.headerView.headerImage = [UIImage imageNamed:@"saber.jpeg"];
    self.headerView.tittle = @"哈哈是个demo";
    self.headerView.isShowLeftButton = YES;
    self.headerView.isShowRightButton = YES;
    __weak typeof(self) weakSelf = self;
    self.headerView.leftClickBlock = ^(UIButton *btn){
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    self.headerView.rightClickBlock  = ^(UIButton *btn){
        NSLog(@"点击了分享");
    };

    [self.webView.scrollView handleSpringHeadView:self.headerView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
