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
        DLog(@"initialize");
        UIBarButtonItem *bbi = [UIBarButtonItem appearance];
        [bbi setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
        [bbi setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateDisabled];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    DLog(@"pushViewController");

    if (self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(didTouchButtonToPopViewController) withImageName:@"navigationbar_back"];

        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemwithTarget:self withAction:@selector(didTouchButtonToPopToRootViewController) withImageName:@"navigationbar_more"];
    }
}

- (UIView *)leftBarButtonItem {
    UIButton *leftBBI = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBBI setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
    [leftBBI setImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];
    [leftBBI addTarget:self action:@selector(didTouchButtonToPopViewController) forControlEvents:UIControlEventTouchUpInside];
    
    leftBBI.size = leftBBI.currentImage.size;
    
    return leftBBI;
}

- (UIView *)rightBarButtonItem {
    UIButton *rightBBI = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBBI setImage:[UIImage imageNamed:@"navigationbar_more"] forState:UIControlStateNormal];
    [rightBBI setImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] forState:UIControlStateHighlighted];
    [rightBBI addTarget:self action:@selector(didTouchButtonToPopToRootViewController) forControlEvents:UIControlEventTouchUpInside];
    
    rightBBI.size = rightBBI.currentImage.size;
    
    return rightBBI;
}

- (void)didTouchButtonToPopViewController{
    [self popViewControllerAnimated:YES];
}

- (void)didTouchButtonToPopToRootViewController{
    [self popToRootViewControllerAnimated:YES];
}

@end
