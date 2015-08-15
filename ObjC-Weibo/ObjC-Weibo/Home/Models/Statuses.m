//
//  Statuses.m
//
//  Created by Dianyi Jiang on 15/08/15
//  Copyright (c) 2015 Dalian 2tSoft. All rights reserved.
//

#import "Statuses.h"
#import "User.h"

NSString *const kStatusesAttitudesCount = @"attitudes_count";
NSString *const kStatusesSource = @"source";
NSString *const kStatusesTruncated = @"truncated";
NSString *const kStatusesSourceType = @"source_type";
NSString *const kStatusesIdstr = @"idstr";
NSString *const kStatusesMid = @"mid";
NSString *const kStatusesAnnotations = @"annotations";
NSString *const kStatusesDarwinTags = @"darwin_tags";
NSString *const kStatusesSourceAllowclick = @"source_allowclick";
NSString *const kStatusesOriginalPic = @"original_pic";
NSString *const kStatusesInReplyToScreenName = @"in_reply_to_screen_name";
NSString *const kStatusesCommentsCount = @"comments_count";
NSString *const kStatusesStickerID = @"stickerID";
NSString *const kStatusesPicUrls = @"pic_urls";
NSString *const kStatusesRepostsCount = @"reposts_count";
NSString *const kStatusesThumbnailPic = @"thumbnail_pic";
NSString *const kStatusesFavorited = @"favorited";
NSString *const kStatusesBmiddlePic = @"bmiddle_pic";
NSString *const kStatusesGeo = @"geo";
NSString *const kStatusesId = @"id";
NSString *const kStatusesUser = @"user";
NSString *const kStatusesInReplyToUserId = @"in_reply_to_user_id";
NSString *const kStatusesFilterID = @"filterID";
NSString *const kStatusesText = @"text";
NSString *const kStatusesMlevel = @"mlevel";
NSString *const kStatusesCreatedAt = @"created_at";
NSString *const kStatusesVisible = @"visible";
NSString *const kStatusesInReplyToStatusId = @"in_reply_to_status_id";

@implementation Statuses

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        
        self.attitudesCount      = [decoder decodeDoubleForKey:kStatusesAttitudesCount];
        self.source              = [decoder decodeObjectForKey:kStatusesSource];
        self.truncated           = [decoder decodeBoolForKey:kStatusesTruncated];
        self.sourceType          = [decoder decodeDoubleForKey:kStatusesSourceType];
        self.idstr               = [decoder decodeObjectForKey:kStatusesIdstr];
        self.mid                 = [decoder decodeObjectForKey:kStatusesMid];
        self.annotations         = [decoder decodeObjectForKey:kStatusesAnnotations];
        self.darwinTags          = [decoder decodeObjectForKey:kStatusesDarwinTags];
        self.sourceAllowclick    = [decoder decodeDoubleForKey:kStatusesSourceAllowclick];
        self.originalPic         = [decoder decodeObjectForKey:kStatusesOriginalPic];
        self.inReplyToScreenName = [decoder decodeObjectForKey:kStatusesInReplyToScreenName];
        self.commentsCount       = [decoder decodeDoubleForKey:kStatusesCommentsCount];
        self.stickerID           = [decoder decodeObjectForKey:kStatusesStickerID];
        self.picUrls             = [decoder decodeObjectForKey:kStatusesPicUrls];
        self.repostsCount        = [decoder decodeDoubleForKey:kStatusesRepostsCount];
        self.thumbnailPic        = [decoder decodeObjectForKey:kStatusesThumbnailPic];
        self.favorited           = [decoder decodeBoolForKey:kStatusesFavorited];
        self.bmiddlePic          = [decoder decodeObjectForKey:kStatusesBmiddlePic];
        self.statusesIdentifier  = [decoder decodeDoubleForKey:kStatusesId];
        self.user                = [decoder decodeObjectForKey:kStatusesUser];
        self.inReplyToUserId     = [decoder decodeObjectForKey:kStatusesInReplyToUserId];
        self.filterID            = [decoder decodeObjectForKey:kStatusesFilterID];
        self.text                = [decoder decodeObjectForKey:kStatusesText];
        self.mlevel              = [decoder decodeDoubleForKey:kStatusesMlevel];
        self.createdAt           = [decoder decodeObjectForKey:kStatusesCreatedAt];
        self.inReplyToStatusId   = [decoder decodeObjectForKey:kStatusesInReplyToStatusId];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeDouble:_attitudesCount forKey:kStatusesAttitudesCount];
    [coder encodeObject:_source forKey:kStatusesSource];
    [coder encodeBool:_truncated forKey:kStatusesTruncated];
    [coder encodeDouble:_sourceType forKey:kStatusesSourceType];
    [coder encodeObject:_idstr forKey:kStatusesIdstr];
    [coder encodeObject:_mid forKey:kStatusesMid];
    [coder encodeObject:_annotations forKey:kStatusesAnnotations];
    [coder encodeObject:_darwinTags forKey:kStatusesDarwinTags];
    [coder encodeDouble:_sourceAllowclick forKey:kStatusesSourceAllowclick];
    [coder encodeObject:_originalPic forKey:kStatusesOriginalPic];
    [coder encodeObject:_inReplyToScreenName forKey:kStatusesInReplyToScreenName];
    [coder encodeDouble:_commentsCount forKey:kStatusesCommentsCount];
    [coder encodeObject:_stickerID forKey:kStatusesStickerID];
    [coder encodeObject:_picUrls forKey:kStatusesPicUrls];
    [coder encodeDouble:_repostsCount forKey:kStatusesRepostsCount];
    [coder encodeObject:_thumbnailPic forKey:kStatusesThumbnailPic];
    [coder encodeBool:_favorited forKey:kStatusesFavorited];
    [coder encodeObject:_bmiddlePic forKey:kStatusesBmiddlePic];
    [coder encodeDouble:_statusesIdentifier forKey:kStatusesId];
    [coder encodeObject:_user forKey:kStatusesUser];
    [coder encodeObject:_inReplyToUserId forKey:kStatusesInReplyToUserId];
    [coder encodeObject:_filterID forKey:kStatusesFilterID];
    [coder encodeObject:_text forKey:kStatusesText];
    [coder encodeDouble:_mlevel forKey:kStatusesMlevel];
    [coder encodeObject:_createdAt forKey:kStatusesCreatedAt];
    [coder encodeObject:_inReplyToStatusId forKey:kStatusesInReplyToStatusId];
}

- (id)copyWithZone:(NSZone *)zone {
    Statuses *copy = [[Statuses alloc] init];
    
    if (copy) {

        copy.attitudesCount      = self.attitudesCount;
        copy.source              = [self.source copyWithZone:zone];
        copy.truncated           = self.truncated;
        copy.sourceType          = self.sourceType;
        copy.idstr               = [self.idstr copyWithZone:zone];
        copy.mid                 = [self.mid copyWithZone:zone];
        copy.annotations         = [self.annotations copyWithZone:zone];
        copy.darwinTags          = [self.darwinTags copyWithZone:zone];
        copy.sourceAllowclick    = self.sourceAllowclick;
        copy.originalPic         = [self.originalPic copyWithZone:zone];
        copy.inReplyToScreenName = [self.inReplyToScreenName copyWithZone:zone];
        copy.commentsCount       = self.commentsCount;
        copy.stickerID           = [self.stickerID copyWithZone:zone];
        copy.picUrls             = [self.picUrls copyWithZone:zone];
        copy.repostsCount        = self.repostsCount;
        copy.thumbnailPic        = [self.thumbnailPic copyWithZone:zone];
        copy.favorited           = self.favorited;
        copy.bmiddlePic          = [self.bmiddlePic copyWithZone:zone];
        copy.statusesIdentifier  = self.statusesIdentifier;
        copy.user                = [self.user copyWithZone:zone];
        copy.inReplyToUserId     = [self.inReplyToUserId copyWithZone:zone];
        copy.filterID            = [self.filterID copyWithZone:zone];
        copy.text                = [self.text copyWithZone:zone];
        copy.mlevel              = self.mlevel;
        copy.createdAt           = [self.createdAt copyWithZone:zone];
        copy.inReplyToStatusId   = [self.inReplyToStatusId copyWithZone:zone];
    }
    return copy;
}


@end
