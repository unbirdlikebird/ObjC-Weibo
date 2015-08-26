//
//  HomeCell.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "HomeCell.h"
#import "Macros.h"
#import "StatusFrame.h"
#import "User.h"

@interface HomeCell ()

@property (nonatomic, weak) UIView *viewOriginal;
@property (nonatomic, weak) UIImageView *imageViewProfile;
@property (nonatomic, weak) UILabel *labelName;
@property (nonatomic, weak) UIImageView *imageViewVipIcon;
@property (nonatomic, weak) UILabel *labelTime;
@property (nonatomic, weak) UILabel *labelSource;
@property (nonatomic, weak) UILabel *labelContent;

@end

@implementation HomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *reuseIdentifier = @"reuseIdentifier";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UIView *viewOriginal = [[UIView alloc] init];
        [self.contentView addSubview:viewOriginal];
        self.viewOriginal = viewOriginal;
        
        UIImageView *imageViewProfile = [[UIImageView alloc] init];
        [self.contentView addSubview:imageViewProfile];
        self.imageViewProfile = imageViewProfile;
        
        UILabel *labelName = [[UILabel alloc] init];
        labelName.font = StatusCellNameFont;
        [self.contentView addSubview:labelName];
        self.labelName = labelName;
        
        UIImageView *imageViewVipIcon = [[UIImageView alloc] init];
        imageViewVipIcon.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageViewVipIcon];
        self.imageViewVipIcon = imageViewVipIcon;
        
        UILabel *labelTime = [[UILabel alloc] init];
        labelTime.font = StatusCellTimeFont;
        [self.contentView addSubview:labelTime];
        self.labelTime = labelTime;
        
        UILabel *labelSource = [[UILabel alloc] init];
        [self.contentView addSubview:labelSource];
        self.labelSource = labelSource;
        
        UILabel *labelContent = [[UILabel alloc] init];
        labelContent.font = StatusCellNameFont;
        labelContent.preferredMaxLayoutWidth = SCREEN_WIDTH - kInset * 4;
        labelContent.numberOfLines = 0;
        [self.contentView addSubview:labelContent];
        self.labelContent = labelContent;
        
    }
    return self;
}

- (void)setStatusFrame:(StatusFrame *)statusFrame {
    
    _statusFrame = statusFrame;
    Status *status = statusFrame.status;
    User *user = status.user;
    
    self.viewOriginal.frame = statusFrame.viewOriginalFrame;
    
    self.imageViewProfile.frame = statusFrame.imageViewProfileFrame;
    [self.imageViewProfile sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
  
    self.labelName.text = user.name;
    self.labelName.frame = statusFrame.labelNameFrame;

    if (user.isVip) {
        self.imageViewVipIcon.hidden = NO;
        self.imageViewVipIcon.frame = statusFrame.imageViewVipIconFrame;
        self.imageViewVipIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"common_icon_membership_level%d", user.mbrank]];
        self.labelName.textColor = [UIColor orangeColor];
    } else {
        self.imageViewVipIcon.hidden = YES;
        self.labelName.textColor = [UIColor blackColor];
    }

    self.labelTime.text = user.created_at;
    self.labelTime.frame = statusFrame.labelTimeFrame;
//
//    self.labelSource.text = status.source;
//    self.labelSource.frame = statusFrame.labelSourceFrame;
//    
    self.labelContent.text = status.text;
    self.labelContent.frame = statusFrame.labelContentFrame;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
