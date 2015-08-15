//
//  Weibo.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 12/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#ifndef ObjC_Weibo_Weibo_h
#define ObjC_Weibo_Weibo_h

#import "UIBarButtonItem+EzInit.h"
#import "UIView+EzFrame.h"
#import "DJTabBar.h"
#import "DJNavigationController.h"
#import "DropdownView.h"
#import "DJHomeVCTitleButton.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "PureLayout.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD+EzHUD.h"

#define kAppKey             @"1927950725"
#define kAppSecret          @"24c0abe5a3599c517a70073e319012c7"
#define kOAuthUrl           @"https://api.weibo.com/oauth2/authorize"
#define kRedirectUri        @"https://api.weibo.com/oauth2/default.html"
#define kAccressTokenUrl    @"https://api.weibo.com/oauth2/access_token"
#define kAccountFileName    @"accountInfo.archive"
#endif
