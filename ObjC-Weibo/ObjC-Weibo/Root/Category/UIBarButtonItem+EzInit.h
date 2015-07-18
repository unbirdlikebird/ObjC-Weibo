//
//  UIBarButtonItem+EzInit.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 18/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (EzInit)

+ (UIBarButtonItem *)barButtonItemwithTarget:(id)target withAction:(SEL)action withImageName:(NSString *)imageName;

@end
