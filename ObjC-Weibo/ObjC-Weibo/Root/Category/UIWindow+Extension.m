//
//  UIWindow+Extension.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 14/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "RootViewController.h"
#import "NewFeatureViewController.h"

@implementation UIWindow (Extension)

- (void)changeRootViewController {
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"CFBundleVersion"];
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    if ([currentVersion isEqualToString:lastVersion]){
        self.rootViewController = [[RootViewController alloc] init];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        self.rootViewController = [[NewFeatureViewController alloc] init];
    }
}

@end
