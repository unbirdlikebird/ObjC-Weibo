//
//  UIView+EZView.h
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (EZView)
/**
 *  frame.origin
 */
@property (nonatomic, assign) CGPoint origin;
/**
 *  frame.orgin.x
 */
@property (nonatomic, assign) CGFloat x;
/**
 *  frame.orgin.y
 */
@property (nonatomic, assign) CGFloat y;
/**
 *  frame.centre.x
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 *  frame.centre.y
 */
@property (nonatomic, assign) CGFloat centerY;
/**
 *  frame.size
 */
@property (nonatomic, assign) CGSize  size;
/**
 *  frame.size.width
 */
@property (nonatomic, assign) CGFloat width;
/**
 *  frame.size.height
 */
@property (nonatomic, assign) CGFloat height;
/**
 *  移除view的subviews
 */
- (void)ez_removeAllSubviews;
/**
 *  为view添加一个单击的点击时间
 */
- (void)ez_addTapGesturesTarget:(id)target selector:(SEL)selector;
/**
 *  返回双倍的size
 */
- (CGSize)ez_doubleSizeOfFrame;
/**
 *  淡入动画
 */
- (CABasicAnimation *)ez_fadeIn;
/**
 *  淡出动画
 */
- (CABasicAnimation *)ez_fadeOut;

@end
