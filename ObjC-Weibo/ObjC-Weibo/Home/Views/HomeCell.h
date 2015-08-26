//
//  HomeCell.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusFrame;

@interface HomeCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong)  StatusFrame *statusFrame;
 
@end
  