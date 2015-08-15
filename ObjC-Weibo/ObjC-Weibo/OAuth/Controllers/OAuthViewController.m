//
//  OAuthViewController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 12/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "OAuthViewController.h"
#import "Macros.h"
#import "AccountTools.h"
#import "UIWindow+Extension.h"

@interface OAuthViewController ()<UIWebViewDelegate>
@property (strong, nonatomic)   UIWebView     *webView;
@end

@implementation OAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", kAppKey, kRedirectUri]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebView Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showMessage:@"loading"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString *url = request.URL.absoluteString;
    NSRange range = [url rangeOfString:@"code="];
    
    if (range.length > 0) {
        NSString *code = [url substringFromIndex:range.location + range.length];
        [self requestAccesstokenWithCode:code];
        return NO;
    }
    
    return YES;
}

- (void)requestAccesstokenWithCode:(NSString *)code {
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    params[@"client_secret"] = kAppSecret;
    params[@"redirect_uri"] = kRedirectUri;
    params[@"grant_type"] = @"authorization_code";
    params[@"client_id"] = kAppKey;
    params[@"code"] = code;

    [mgr POST:kAccressTokenUrl parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        [MBProgressHUD hideHUD];
        
        [AccountTools saveAccount:[Account accountWithDict:responseObject]];
        
        [[UIApplication sharedApplication].keyWindow changeRootViewController];
        
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUD];
        DBGLog(@"%@", operation);
    }];
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
