//
//  User.m
//
//  Created by Dianyi Jiang on 15/08/15
//  Copyright (c) 2015 Dalian 2tSoft. All rights reserved.
//

#import "User.h"
#import "MJExtension.h"

@implementation User

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"classProperty":@"class", @"userIdentifier":@"id", @"userDescription":@"description" };
}

- (void)setMbtype:(double)mbtype {
    _mbtype = mbtype;
    self.vip = mbtype > 2;
}


@end
