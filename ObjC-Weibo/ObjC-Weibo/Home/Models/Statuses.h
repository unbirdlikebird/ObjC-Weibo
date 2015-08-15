//
//  Statuses.h
//
//  Created by Dianyi Jiang on 15/08/15
//  Copyright (c) 2015 Dalian 2tSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Statuses : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double   attitudesCount;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) BOOL     truncated;
@property (nonatomic, assign) double   sourceType;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSArray  *annotations;
@property (nonatomic, strong) NSArray  *darwinTags;
@property (nonatomic, assign) double   sourceAllowclick;
@property (nonatomic, strong) NSString *originalPic;
@property (nonatomic, strong) NSString *inReplyToScreenName;
@property (nonatomic, assign) double   commentsCount;
@property (nonatomic, strong) NSString *stickerID;
@property (nonatomic, strong) NSArray  *picUrls;
@property (nonatomic, assign) double   repostsCount;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, assign) BOOL     favorited;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, assign) double   statusesIdentifier;
@property (nonatomic, strong) User     *user;
@property (nonatomic, strong) NSString *inReplyToUserId;
@property (nonatomic, strong) NSString *filterID;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) double   mlevel;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *inReplyToStatusId;

@end
