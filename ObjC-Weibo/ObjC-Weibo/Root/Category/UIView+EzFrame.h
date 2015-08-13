//
//  UIView+EzFrame.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 18/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EzFrame)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat centerY;

@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize  size;
@property (assign, nonatomic) CGPoint origin;
@end
