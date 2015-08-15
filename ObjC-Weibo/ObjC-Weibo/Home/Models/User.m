//
//  User.m
//
//  Created by Dianyi Jiang on 15/08/15
//  Copyright (c) 2015 Dalian 2tSoft. All rights reserved.
//

#import "User.h"

NSString *const kUserCoverImagePhone = @"cover_image_phone";
NSString *const kUserId = @"id";
NSString *const kUserBiFollowersCount = @"bi_followers_count";
NSString *const kUserUrank = @"urank";
NSString *const kUserProfileImageUrl = @"profile_image_url";
NSString *const kUserClass = @"class";
NSString *const kUserVerifiedContactEmail = @"verified_contact_email";
NSString *const kUserProvince = @"province";
NSString *const kUserVerified = @"verified";
NSString *const kUserUrl = @"url";
NSString *const kUserFollowMe = @"follow_me";
NSString *const kUserGeoEnabled = @"geo_enabled";
NSString *const kUserStatusesCount = @"statuses_count";
NSString *const kUserDescription = @"description";
NSString *const kUserFollowersCount = @"followers_count";
NSString *const kUserVerifiedContactMobile = @"verified_contact_mobile";
NSString *const kUserLocation = @"location";
NSString *const kUserMbrank = @"mbrank";
NSString *const kUserAvatarLarge = @"avatar_large";
NSString *const kUserStar = @"star";
NSString *const kUserVerifiedTrade = @"verified_trade";
NSString *const kUserWeihao = @"weihao";
NSString *const kUserProfileUrl = @"profile_url";
NSString *const kUserOnlineStatus = @"online_status";
NSString *const kUserCoverImage = @"cover_image";
NSString *const kUserVerifiedContactName = @"verified_contact_name";
NSString *const kUserVerifiedSourceUrl = @"verified_source_url";
NSString *const kUserScreenName = @"screen_name";
NSString *const kUserPagefriendsCount = @"pagefriends_count";
NSString *const kUserVerifiedReason = @"verified_reason";
NSString *const kUserName = @"name";
NSString *const kUserFriendsCount = @"friends_count";
NSString *const kUserMbtype = @"mbtype";
NSString *const kUserBlockApp = @"block_app";
NSString *const kUserAvatarHd = @"avatar_hd";
NSString *const kUserCreditScore = @"credit_score";
NSString *const kUserRemark = @"remark";
NSString *const kUserCreatedAt = @"created_at";
NSString *const kUserBlockWord = @"block_word";
NSString *const kUserAllowAllActMsg = @"allow_all_act_msg";
NSString *const kUserVerifiedState = @"verified_state";
NSString *const kUserDianping = @"dianping";
NSString *const kUserDomain = @"domain";
NSString *const kUserVerifiedReasonModified = @"verified_reason_modified";
NSString *const kUserAllowAllComment = @"allow_all_comment";
NSString *const kUserVerifiedLevel = @"verified_level";
NSString *const kUserVerifiedReasonUrl = @"verified_reason_url";
NSString *const kUserGender = @"gender";
NSString *const kUserFavouritesCount = @"favourites_count";
NSString *const kUserIdstr = @"idstr";
NSString *const kUserVerifiedType = @"verified_type";
NSString *const kUserCity = @"city";
NSString *const kUserVerifiedSource = @"verified_source";
NSString *const kUserUserAbility = @"user_ability";
NSString *const kUserLang = @"lang";
NSString *const kUserPtype = @"ptype";
NSString *const kUserFollowing = @"following";

@implementation User

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        
        self.coverImagePhone        = [decoder decodeObjectForKey:kUserCoverImagePhone];
        self.userIdentifier         = [decoder decodeDoubleForKey:kUserId];
        self.biFollowersCount       = [decoder decodeDoubleForKey:kUserBiFollowersCount];
        self.urank                  = [decoder decodeDoubleForKey:kUserUrank];
        self.profileImageUrl        = [decoder decodeObjectForKey:kUserProfileImageUrl];
        self.classProperty          = [decoder decodeDoubleForKey:kUserClass];
        self.verifiedContactEmail   = [decoder decodeObjectForKey:kUserVerifiedContactEmail];
        self.province               = [decoder decodeObjectForKey:kUserProvince];
        self.verified               = [decoder decodeBoolForKey:kUserVerified];
        self.url                    = [decoder decodeObjectForKey:kUserUrl];
        self.followMe               = [decoder decodeBoolForKey:kUserFollowMe];
        self.geoEnabled             = [decoder decodeBoolForKey:kUserGeoEnabled];
        self.statusesCount          = [decoder decodeDoubleForKey:kUserStatusesCount];
        self.userDescription        = [decoder decodeObjectForKey:kUserDescription];
        self.followersCount         = [decoder decodeDoubleForKey:kUserFollowersCount];
        self.verifiedContactMobile  = [decoder decodeObjectForKey:kUserVerifiedContactMobile];
        self.location               = [decoder decodeObjectForKey:kUserLocation];
        self.mbrank                 = [decoder decodeDoubleForKey:kUserMbrank];
        self.avatarLarge            = [decoder decodeObjectForKey:kUserAvatarLarge];
        self.star                   = [decoder decodeDoubleForKey:kUserStar];
        self.verifiedTrade          = [decoder decodeObjectForKey:kUserVerifiedTrade];
        self.weihao                 = [decoder decodeObjectForKey:kUserWeihao];
        self.profileUrl             = [decoder decodeObjectForKey:kUserProfileUrl];
        self.onlineStatus           = [decoder decodeDoubleForKey:kUserOnlineStatus];
        self.coverImage             = [decoder decodeObjectForKey:kUserCoverImage];
        self.verifiedContactName    = [decoder decodeObjectForKey:kUserVerifiedContactName];
        self.verifiedSourceUrl      = [decoder decodeObjectForKey:kUserVerifiedSourceUrl];
        self.screenName             = [decoder decodeObjectForKey:kUserScreenName];
        self.pagefriendsCount       = [decoder decodeDoubleForKey:kUserPagefriendsCount];
        self.verifiedReason         = [decoder decodeObjectForKey:kUserVerifiedReason];
        self.name                   = [decoder decodeObjectForKey:kUserName];
        self.friendsCount           = [decoder decodeDoubleForKey:kUserFriendsCount];
        self.mbtype                 = [decoder decodeDoubleForKey:kUserMbtype];
        self.blockApp               = [decoder decodeDoubleForKey:kUserBlockApp];
        self.avatarHd               = [decoder decodeObjectForKey:kUserAvatarHd];
        self.creditScore            = [decoder decodeDoubleForKey:kUserCreditScore];
        self.remark                 = [decoder decodeObjectForKey:kUserRemark];
        self.createdAt              = [decoder decodeObjectForKey:kUserCreatedAt];
        self.blockWord              = [decoder decodeDoubleForKey:kUserBlockWord];
        self.allowAllActMsg         = [decoder decodeBoolForKey:kUserAllowAllActMsg];
        self.verifiedState          = [decoder decodeDoubleForKey:kUserVerifiedState];
        self.dianping               = [decoder decodeObjectForKey:kUserDianping];
        self.domain                 = [decoder decodeObjectForKey:kUserDomain];
        self.verifiedReasonModified = [decoder decodeObjectForKey:kUserVerifiedReasonModified];
        self.allowAllComment        = [decoder decodeBoolForKey:kUserAllowAllComment];
        self.verifiedLevel          = [decoder decodeDoubleForKey:kUserVerifiedLevel];
        self.verifiedReasonUrl      = [decoder decodeObjectForKey:kUserVerifiedReasonUrl];
        self.gender                 = [decoder decodeObjectForKey:kUserGender];
        self.favouritesCount        = [decoder decodeDoubleForKey:kUserFavouritesCount];
        self.idstr                  = [decoder decodeObjectForKey:kUserIdstr];
        self.verifiedType           = [decoder decodeDoubleForKey:kUserVerifiedType];
        self.city                   = [decoder decodeObjectForKey:kUserCity];
        self.verifiedSource         = [decoder decodeObjectForKey:kUserVerifiedSource];
        self.userAbility            = [decoder decodeDoubleForKey:kUserUserAbility];
        self.lang                   = [decoder decodeObjectForKey:kUserLang];
        self.ptype                  = [decoder decodeDoubleForKey:kUserPtype];
        self.following              = [decoder decodeBoolForKey:kUserFollowing];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:_coverImagePhone forKey:kUserCoverImagePhone];
    [coder encodeDouble:_userIdentifier forKey:kUserId];
    [coder encodeDouble:_biFollowersCount forKey:kUserBiFollowersCount];
    [coder encodeDouble:_urank forKey:kUserUrank];
    [coder encodeObject:_profileImageUrl forKey:kUserProfileImageUrl];
    [coder encodeDouble:_classProperty forKey:kUserClass];
    [coder encodeObject:_verifiedContactEmail forKey:kUserVerifiedContactEmail];
    [coder encodeObject:_province forKey:kUserProvince];
    [coder encodeBool:_verified forKey:kUserVerified];
    [coder encodeObject:_url forKey:kUserUrl];
    [coder encodeBool:_followMe forKey:kUserFollowMe];
    [coder encodeBool:_geoEnabled forKey:kUserGeoEnabled];
    [coder encodeDouble:_statusesCount forKey:kUserStatusesCount];
    [coder encodeObject:_userDescription forKey:kUserDescription];
    [coder encodeDouble:_followersCount forKey:kUserFollowersCount];
    [coder encodeObject:_verifiedContactMobile forKey:kUserVerifiedContactMobile];
    [coder encodeObject:_location forKey:kUserLocation];
    [coder encodeDouble:_mbrank forKey:kUserMbrank];
    [coder encodeObject:_avatarLarge forKey:kUserAvatarLarge];
    [coder encodeDouble:_star forKey:kUserStar];
    [coder encodeObject:_verifiedTrade forKey:kUserVerifiedTrade];
    [coder encodeObject:_weihao forKey:kUserWeihao];
    [coder encodeObject:_profileUrl forKey:kUserProfileUrl];
    [coder encodeDouble:_onlineStatus forKey:kUserOnlineStatus];
    [coder encodeObject:_coverImage forKey:kUserCoverImage];
    [coder encodeObject:_verifiedContactName forKey:kUserVerifiedContactName];
    [coder encodeObject:_verifiedSourceUrl forKey:kUserVerifiedSourceUrl];
    [coder encodeObject:_screenName forKey:kUserScreenName];
    [coder encodeDouble:_pagefriendsCount forKey:kUserPagefriendsCount];
    [coder encodeObject:_verifiedReason forKey:kUserVerifiedReason];
    [coder encodeObject:_name forKey:kUserName];
    [coder encodeDouble:_friendsCount forKey:kUserFriendsCount];
    [coder encodeDouble:_mbtype forKey:kUserMbtype];
    [coder encodeDouble:_blockApp forKey:kUserBlockApp];
    [coder encodeObject:_avatarHd forKey:kUserAvatarHd];
    [coder encodeDouble:_creditScore forKey:kUserCreditScore];
    [coder encodeObject:_remark forKey:kUserRemark];
    [coder encodeObject:_createdAt forKey:kUserCreatedAt];
    [coder encodeDouble:_blockWord forKey:kUserBlockWord];
    [coder encodeBool:_allowAllActMsg forKey:kUserAllowAllActMsg];
    [coder encodeDouble:_verifiedState forKey:kUserVerifiedState];
    [coder encodeObject:_dianping forKey:kUserDianping];
    [coder encodeObject:_domain forKey:kUserDomain];
    [coder encodeObject:_verifiedReasonModified forKey:kUserVerifiedReasonModified];
    [coder encodeBool:_allowAllComment forKey:kUserAllowAllComment];
    [coder encodeDouble:_verifiedLevel forKey:kUserVerifiedLevel];
    [coder encodeObject:_verifiedReasonUrl forKey:kUserVerifiedReasonUrl];
    [coder encodeObject:_gender forKey:kUserGender];
    [coder encodeDouble:_favouritesCount forKey:kUserFavouritesCount];
    [coder encodeObject:_idstr forKey:kUserIdstr];
    [coder encodeDouble:_verifiedType forKey:kUserVerifiedType];
    [coder encodeObject:_city forKey:kUserCity];
    [coder encodeObject:_verifiedSource forKey:kUserVerifiedSource];
    [coder encodeDouble:_userAbility forKey:kUserUserAbility];
    [coder encodeObject:_lang forKey:kUserLang];
    [coder encodeDouble:_ptype forKey:kUserPtype];
    [coder encodeBool:_following forKey:kUserFollowing];
}

- (id)copyWithZone:(NSZone *)zone {
    User *copy = [[User alloc] init];
    
    if (copy) {

        copy.coverImagePhone        = [self.coverImagePhone copyWithZone:zone];
        copy.userIdentifier         = self.userIdentifier;
        copy.biFollowersCount       = self.biFollowersCount;
        copy.urank                  = self.urank;
        copy.profileImageUrl        = [self.profileImageUrl copyWithZone:zone];
        copy.classProperty          = self.classProperty;
        copy.verifiedContactEmail   = [self.verifiedContactEmail copyWithZone:zone];
        copy.province               = [self.province copyWithZone:zone];
        copy.verified               = self.verified;
        copy.url                    = [self.url copyWithZone:zone];
        copy.followMe               = self.followMe;
        copy.geoEnabled             = self.geoEnabled;
        copy.statusesCount          = self.statusesCount;
        copy.userDescription        = [self.userDescription copyWithZone:zone];
        copy.followersCount         = self.followersCount;
        copy.verifiedContactMobile  = [self.verifiedContactMobile copyWithZone:zone];
        copy.location               = [self.location copyWithZone:zone];
        copy.mbrank                 = self.mbrank;
        copy.avatarLarge            = [self.avatarLarge copyWithZone:zone];
        copy.star                   = self.star;
        copy.verifiedTrade          = [self.verifiedTrade copyWithZone:zone];
        copy.weihao                 = [self.weihao copyWithZone:zone];
        copy.profileUrl             = [self.profileUrl copyWithZone:zone];
        copy.onlineStatus           = self.onlineStatus;
        copy.coverImage             = [self.coverImage copyWithZone:zone];
        copy.verifiedContactName    = [self.verifiedContactName copyWithZone:zone];
        copy.verifiedSourceUrl      = [self.verifiedSourceUrl copyWithZone:zone];
        copy.screenName             = [self.screenName copyWithZone:zone];
        copy.pagefriendsCount       = self.pagefriendsCount;
        copy.verifiedReason         = [self.verifiedReason copyWithZone:zone];
        copy.name                   = [self.name copyWithZone:zone];
        copy.friendsCount           = self.friendsCount;
        copy.mbtype                 = self.mbtype;
        copy.blockApp               = self.blockApp;
        copy.avatarHd               = [self.avatarHd copyWithZone:zone];
        copy.creditScore            = self.creditScore;
        copy.remark                 = [self.remark copyWithZone:zone];
        copy.createdAt              = [self.createdAt copyWithZone:zone];
        copy.blockWord              = self.blockWord;
        copy.allowAllActMsg         = self.allowAllActMsg;
        copy.verifiedState          = self.verifiedState;
        copy.dianping               = [self.dianping copyWithZone:zone];
        copy.domain                 = [self.domain copyWithZone:zone];
        copy.verifiedReasonModified = [self.verifiedReasonModified copyWithZone:zone];
        copy.allowAllComment        = self.allowAllComment;
        copy.verifiedLevel          = self.verifiedLevel;
        copy.verifiedReasonUrl      = [self.verifiedReasonUrl copyWithZone:zone];
        copy.gender                 = [self.gender copyWithZone:zone];
        copy.favouritesCount        = self.favouritesCount;
        copy.idstr                  = [self.idstr copyWithZone:zone];
        copy.verifiedType           = self.verifiedType;
        copy.city                   = [self.city copyWithZone:zone];
        copy.verifiedSource         = [self.verifiedSource copyWithZone:zone];
        copy.userAbility            = self.userAbility;
        copy.lang                   = [self.lang copyWithZone:zone];
        copy.ptype                  = self.ptype;
        copy.following              = self.following;
    }
    return copy;
}


@end
