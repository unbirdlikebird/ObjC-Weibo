//
//  Statuses.h
//
//  Created by Dianyi Jiang on 15/08/15
//  Copyright (c) 2015 Dalian 2tSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Status : NSObject

@property (nonatomic, assign) BOOL     favorited;
@property (nonatomic, assign) BOOL     truncated;
@property (nonatomic, assign) double   mlevel;
@property (nonatomic, assign) double   statusesIdentifier;
@property (nonatomic, assign) double   comments_count;
@property (nonatomic, assign) double   reposts_count;
@property (nonatomic, assign) double   source_allowclick;
@property (nonatomic, assign) double   source_type;
@property (nonatomic, assign) double   attitudes_count;

@property (nonatomic, strong) NSArray  *pic_urls;
@property (nonatomic, strong) NSArray  *darwin_tags;
@property (nonatomic, strong) NSArray  *annotations;

@property (nonatomic, copy  ) NSString *source;
@property (nonatomic, copy  ) NSString *idstr;
@property (nonatomic, copy  ) NSString *mid;
@property (nonatomic, copy  ) NSString *original_pic;
@property (nonatomic, copy  ) NSString *in_reply_to_screen_name;
@property (nonatomic, copy  ) NSString *thumbnail_pic;
@property (nonatomic, copy  ) NSString *bmiddlePic;
@property (nonatomic, copy  ) NSString *in_reply_to_user_id;
@property (nonatomic, copy  ) NSString *filterID;
@property (nonatomic, copy  ) NSString *text;
@property (nonatomic, copy  ) NSString *created_at;
@property (nonatomic, copy  ) NSString *in_reply_to_status_id;
@property (nonatomic, strong) User     *user;

@end
