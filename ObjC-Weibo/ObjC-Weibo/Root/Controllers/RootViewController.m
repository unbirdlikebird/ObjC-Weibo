//
//  RootViewController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 17/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self addChildVC:homeVC withTitle:@"home" withImageName:@"tabbar_home"];
    
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    [self addChildVC:messageVC withTitle:@"message" withImageName:@"tabbar_message_center"];
    
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
    [self addChildVC:discoverVC withTitle:@"discover" withImageName:@"tabbar_discover"];
    
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    [self addChildVC:profileVC withTitle:@"profile" withImageName:@"tabbar_profile"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildVC:(UIViewController *)childVC withTitle:(NSString *)title withImageName:(NSString *)imageName {
    
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:navigationController];
}

@end
