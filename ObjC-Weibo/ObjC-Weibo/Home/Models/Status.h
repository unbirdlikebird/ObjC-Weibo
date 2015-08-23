//
//  Statuses.h
//
//  Created by Dianyi Jiang on 15/08/15
//  Copyright (c) 2015 Dalian 2tSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Status : NSObject

@property (nonatomic, assign) double   attitudesCount;
@property (nonatomic, copy  ) NSString *source;
@property (nonatomic, assign) BOOL     truncated;
@property (nonatomic, assign) double   sourceType;
@property (nonatomic, copy  ) NSString *idstr;
@property (nonatomic, copy  ) NSString *mid;
@property (nonatomic, strong) NSArray  *annotations;
@property (nonatomic, strong) NSArray  *darwinTags;
@property (nonatomic, assign) double   sourceAllowclick;
@property (nonatomic, copy  ) NSString *originalPic;
@property (nonatomic, copy  ) NSString *inReplyToScreenName;
@property (nonatomic, assign) double   commentsCount;
@property (nonatomic, copy  ) NSString *stickerID;
@property (nonatomic, strong) NSArray  *picUrls;
@property (nonatomic, assign) double   repostsCount;
@property (nonatomic, copy  ) NSString *thumbnailPic;
@property (nonatomic, assign) BOOL     favorited;
@property (nonatomic, copy  ) NSString *bmiddlePic;
@property (nonatomic, assign) double   statusesIdentifier;
@property (nonatomic, strong) User     *user;
@property (nonatomic, copy  ) NSString *inReplyToUserId;
@property (nonatomic, copy  ) NSString *filterID;
@property (nonatomic, copy  ) NSString *text;
@property (nonatomic, assign) double   mlevel;
@property (nonatomic, copy  ) NSString *createdAt;
@property (nonatomic, copy  ) NSString *inReplyToStatusId;

@end
