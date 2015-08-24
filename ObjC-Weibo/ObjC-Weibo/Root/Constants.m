//
//  Constants.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "Constants.h"

NSString *const kAppKey          = @"1927950725";
NSString *const kAppSecret       = @"24c0abe5a3599c517a70073e319012c7";
NSString *const kOAuthUrl        = @"https://api.weibo.com/oauth2/authorize";
NSString *const kRedirectUri     = @"https://api.weibo.com/oauth2/default.html";
NSString *const kAccressTokenUrl = @"https://api.weibo.com/oauth2/access_token";
NSString *const kTimeline        = @"https://api.weibo.com/2/statuses/public_timeline.json";
NSString *const kFriendsTimeline = @"https://api.weibo.com/2/statuses/friends_timeline.json";
NSString *const kUserInfoUrl     = @"https://api.weibo.com/2/users/show.json";
NSString *const kUnreadMsgCount  = @"https://rm.api.weibo.com/2/remind/unread_count.json";

float const     kInset           = 8;
float const     kMinWidth        = 1;
float const     kMaxWidth        = 150;


@implementation Constants

@end
