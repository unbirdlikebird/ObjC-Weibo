//
//  Account.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 14/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject<NSCoding>

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *expires_in;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, strong) NSDate *created_time;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
