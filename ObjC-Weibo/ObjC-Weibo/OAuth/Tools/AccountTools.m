//
//  AccountTools.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 14/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//
#define AccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:kAccountFileName]

#import "AccountTools.h"
#import "Macros.h"
#import "Account.h"

@implementation AccountTools

+ (void)saveAccount:(Account *)account {
    
    account.created_time = [NSDate date];
    
    [NSKeyedArchiver archiveRootObject:account toFile:AccountFilePath];
}

+ (Account *)account {
    
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFilePath];
   
    long long expires_in = [account.expires_in longLongValue];
    
    NSDate *expired_time = [account.created_time dateByAddingTimeInterval:expires_in];
    
    NSDate *now = [NSDate date];
    
    return [expired_time compare:now] == NSOrderedDescending?account:nil;
}

@end
