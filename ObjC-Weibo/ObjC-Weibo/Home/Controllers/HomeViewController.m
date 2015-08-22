//
//  HomeViewController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 17/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "HomeViewController.h"
#import "Macros.h"
#import "AccountTools.h"
#import "User.h"
#import "Statuses.h"

@interface HomeViewController ()
@property (nonatomic, strong) NSArray *statuses;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    [self setupUserInfo];
    [self requestTimeline];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    DBGLog(@"didReceiveMemoryWarning");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.view.backgroundColor = RGBRANDOM;
}

#pragma mark - private

- (void)setupUserInfo {

    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    Account *account = [AccountTools account];

    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    [mgr GET:kUserInfoUrl parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        User *user = [User objectWithKeyValues:responseObject];
        UIButton *button = (UIButton *)self.navigationItem.titleView;
        [button setTitle:user.name forState:UIControlStateNormal];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        DBGLog(@"%@", error);
    }];
}

- (void)requestTimeline {
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    Account *account = [AccountTools account];
    
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    [mgr GET:kTimeline parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

        AlertLog(@"%@", responseObject);
        
        self.statuses = [Statuses objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        DBGLog(@"%@", error);
    }];
}

#pragma mark - navigatioin item

- (void)setupNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(friendsearch) withImageName:@"navigationbar_friendsearch"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(friendsearch) withImageName:@"navigationbar_pop"];
    
    DJHomeVCTitleButton *btnTitleView = [[DJHomeVCTitleButton alloc]init];
//    [btnTitleView setTitle:@"首页" forState:UIControlStateNormal];
    [btnTitleView addTarget:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.titleView = btnTitleView;
}

- (void)friendsearch{

    DBGLog(@"friend search");
}

#pragma mark - data init 


@end