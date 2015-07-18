//
//  UIBarButtonItem+EzInit.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 18/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "UIBarButtonItem+EzInit.h"
#import "Macros.h"

@implementation UIBarButtonItem (EzInit)

+ (UIBarButtonItem *)barButtonItemwithTarget:(id)target withAction:(SEL)action withImageName:(NSString *)imageName{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", imageName]] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = button.currentImage.size;
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
