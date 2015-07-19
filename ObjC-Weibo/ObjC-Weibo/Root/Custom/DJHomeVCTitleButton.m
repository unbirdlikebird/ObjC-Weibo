//
//  DJHomeVCTitleButton.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 19/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "DJHomeVCTitleButton.h"
#import "Macros.h"

@implementation DJHomeVCTitleButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.titleLabel setFont: [UIFont boldSystemFontOfSize:17]];
    }
    return self;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 8;
}


@end
