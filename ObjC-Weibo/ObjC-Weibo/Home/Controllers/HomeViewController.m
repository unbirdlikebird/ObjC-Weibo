//
//  HomeViewController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 17/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "HomeViewController.h"
#import "Macros.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(friendsearch) withImageName:@"navigationbar_friendsearch"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(friendsearch) withImageName:@"navigationbar_pop"];
    
    DJHomeVCTitleButton *btnTitleView = [[DJHomeVCTitleButton alloc]init];
    [btnTitleView setTitle:@"首页" forState:UIControlStateNormal];
    [btnTitleView addTarget:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = btnTitleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.view.backgroundColor = RGBRANDOM;
}

- (void)friendsearch{

    DBGLog(@"friend search");
}

@end
