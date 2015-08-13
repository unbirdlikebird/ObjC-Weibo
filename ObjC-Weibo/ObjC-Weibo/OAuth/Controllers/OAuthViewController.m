//
//  OAuthViewController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 12/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "OAuthViewController.h"
#import "Macros.h"

@interface OAuthViewController ()<UIWebViewDelegate>
@property (strong, nonatomic)   UIWebView     *webView;
@end

@implementation OAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", kOAuthUrl, kAppKey, kAppSecret]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebView Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

#pragma mark - UI Elements

- (UIWebView *)webView {
    if (!_webView){
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.delegate = self;
    }
    return _webView;
}

@end
