//
//  StatusFrame.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 26/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "StatusFrame.h"
#import "Macros.h"
#import "User.h"

@implementation StatusFrame

- (void)setStatus:(Status *)status {
    _status = status;

    User *user = status.user;
    
    self.imageViewProfileFrame = CGRectMake(kInset, kInset, 50, 50);
    
    CGFloat nameX = CGRectGetMaxX(self.imageViewProfileFrame) + kInset;
    CGFloat nameY = kInset;
    CGSize nameSize = [user.name ez_sizeWithFont:StatusCellNameFont];
    self.labelNameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    if (user.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.labelNameFrame) + kInset;
        CGFloat vipY = nameY;
        CGSize vipSize = CGSizeMake(nameSize.height, nameSize.height);
        self.imageViewVipIconFrame = CGRectMake(vipX, vipY, vipSize.width, vipSize.height);
    }
    
    CGFloat timeX = nameX;
    CGSize timeSize = [status.created_at ez_sizeWithFont:StatusCellTimeFont];
    CGFloat timeY = CGRectGetMaxY(self.imageViewProfileFrame) - timeSize.height;
    self.labelTimeFrame = (CGRect){{timeX, timeY}, timeSize};
    
    CGFloat contentX = kInset;
    CGFloat contentY = CGRectGetMaxY(self.imageViewProfileFrame) + kInset;
    CGSize contentSize = [status.text ez_sizeWithFont:StatusCellNameFont withMaxWidth:SCREEN_WIDTH - kInset * 2];
    self.labelContentFrame = (CGRect){{contentX, contentY}, contentSize};

    CGPoint originalOrign = CGPointZero;
    CGSize originalSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.labelContentFrame));
    self.viewOriginalFrame = (CGRect){originalOrign, originalSize};
    
    
    
    self.cellHeight = CGRectGetHeight(self.viewOriginalFrame) + kInset;
}

@end
