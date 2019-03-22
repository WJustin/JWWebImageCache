//
//  JWViewController.m
//  JWWebImageCache
//
//  Created by Justin.wang on 03/22/2019.
//  Copyright (c) 2019 Justin.wang. All rights reserved.
//

#import "JWViewController.h"
#import <WebKit/WebKit.h>

@interface JWViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIButton *reloadButton;

@end

@implementation JWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self reload];
}

- (void)initUI {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds
                                      configuration:configuration];
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self.view addSubview:self.webView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.center = self.view.center;
    button.bounds = CGRectMake(0, 0, 100, 50);
    [button setTitle:@"reload" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(reload)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)reload {
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc] init];
    mutableRequest.URL = [NSURL URLWithString:@"https://www.baidu.com/"];
    [self.webView loadRequest:mutableRequest];
}

@end
