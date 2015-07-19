//
//  DJNavigationController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 18/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "DJNavigationController.h"
#import "Macros.h"

@implementation DJNavigationController

+ (void)initialize
{
    if (self == [self class]) {
        UIBarButtonItem *bbi = [UIBarButtonItem appearance];
        [bbi setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
        [bbi setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateDisabled];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];

    if (self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(didTouchButtonToPopViewController) withImageName:@"navigationbar_back"];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(didTouchButtonToPopToRootViewController) withImageName:@"navigationbar_more"];
    }
}

- (void)didTouchButtonToPopViewController{
    [self popViewControllerAnimated:YES];
}

- (void)didTouchButtonToPopToRootViewController{
    [self popToRootViewControllerAnimated:YES];
}

@end
