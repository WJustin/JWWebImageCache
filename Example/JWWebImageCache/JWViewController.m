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

@end

@implementation JWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWKWebView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"local"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
}

- (void)initWKWebView {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds
                                      configuration:configuration];
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self.view addSubview:self.webView];
}

@end
