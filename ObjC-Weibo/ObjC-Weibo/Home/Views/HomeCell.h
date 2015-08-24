//
//  HomeCell.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell

@property (nonatomic, weak) UIImageView *imageViewProfile;
@property (nonatomic, weak) UIImageView *imageViewVIP;
@property (nonatomic, weak) UILabel *labelUserName;
@property (nonatomic, weak) UILabel *labelContent;
@property (nonatomic, weak) UILabel *labelTime;


@end
