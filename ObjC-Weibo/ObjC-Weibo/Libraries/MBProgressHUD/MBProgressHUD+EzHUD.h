//
//  MBProgressHUD+EzHUD.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 14/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (EzHUD)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
@end
