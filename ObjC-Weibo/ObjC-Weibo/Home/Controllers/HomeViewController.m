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
#import "Status.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *statuses;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    [self setupNavigationItem];
    [self setupUserInfo];
    [self setupRefresh];
    
//    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(setupUnreadMessageCount) userInfo:nil repeats:YES];
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

#pragma mark - private

- (void)setupUnreadMessageCount {
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [AccountTools account].access_token;
    params[@"id"] = [AccountTools account].uid;
    
    [mgr GET:kUnreadMsgCount parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DBGLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)setupRefresh {
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(pageRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    [refreshControl beginRefreshing];
    [self pageRefresh:refreshControl];
}

- (void)pageRefresh:(UIRefreshControl *)sender {
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    Account *account = [AccountTools account];
    
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    params[@"count"] = @20;
    Status *status = [self.statuses firstObject];
    if (status) {
        params[@"since_id"] = status.idstr;
    }
    
    [mgr GET:kTimeline parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        if ([sender isRefreshing]) {
            [sender endRefreshing];
        }
        NSArray *newStatuses = [Status objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        NSIndexSet *newStatuesLocation = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newStatuses.count)];
        [self.statuses insertObjects:newStatuses atIndexes:newStatuesLocation];

        [sender endRefreshing];
        [self.tableView reloadData];
        [self showNewStatusCount:newStatuses.count];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ([sender isRefreshing]) {
            [sender endRefreshing];
        }
        DBGLog(@"%@", error);
    }];
}

#pragma mark - Show New Data Count

- (void)showNewStatusCount:(NSInteger)count
{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.width = SCREEN_WIDTH;
    label.height = 35;
    
    if (count == 0) {
        label.text = @"没有新的微博数据，稍后再试";
    } else {
        label.text = [NSString stringWithFormat:@"共有%ld条新的微博数据", count];
    }
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.x = 0;
    label.y = 64 - label.height;
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
   
    CGFloat duration = 0.7;
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:UIViewAnimationOptionAutoreverse animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, label.height );
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}

- (void)setupUserInfo {

    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"reuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Status *status = self.statuses[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:status.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"compose_pic_add_highlighted"]];
    cell.textLabel.text = status.user.name;
    cell.detailTextLabel.text = status.text;
}

#pragma mark - data init

- (UITableView *)tableView {
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)statuses {
    if (!_statuses){
        _statuses = [[NSMutableArray alloc] init];
    }
    return _statuses;
}

@end