//
//  AccountTools.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 14/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Account;

@interface AccountTools : NSObject

+ (void)saveAccount:(Account *)account;
+ (Account *)account;

@end
