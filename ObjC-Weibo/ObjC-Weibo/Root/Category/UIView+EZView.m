//
//  UIView+EZView.m
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "UIView+EZView.h"

@implementation UIView (EZView)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)ez_removeAllSubviews {
    while (self.subviews.count) {
        UIView *subview = self.subviews.lastObject;
        [subview removeFromSuperview];
    }
}

- (void)ez_addTapGesturesTarget:(id)target selector:(SEL)selector {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [tapGesture setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tapGesture];
}

- (CGSize)ez_doubleSizeOfFrame {
    CGSize size = self.frame.size;
    return CGSizeMake(size.width * 2, size.height * 2);
}

- (CABasicAnimation *)ez_fadeIn {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 0.35;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:0.8f];
    return animation;
}

- (CABasicAnimation *)ez_fadeOut {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 0.2;
    animation.fromValue = [NSNumber numberWithFloat:0.8f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];
    return animation;
}

//- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint {
//    CAGradientLayer *layer = [CAGradientLayer layer];
//    layer.frame = self.bounds;
//    if (cgColorArray && [cgColorArray count] > 0) {
//        layer.colors = cgColorArray;
//    } else {
//        return;
//    }
//    if (floatNumArray && [floatNumArray count] == [cgColorArray count]) {
//        layer.locations = floatNumArray;
//    }
//    layer.startPoint = startPoint;
//    layer.endPoint = endPoint;
//    [self.layer addSublayer:layer];
//}

//- (UIImage *)screenshot {
//    CGSize imageSize = [self bounds].size;
//    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    CGContextTranslateCTM(context, [self center].x, [self center].y);
//    CGContextConcatCTM(context, [self transform]);
//    CGContextTranslateCTM(context,
//                          -[self bounds].size.width * [[self layer] anchorPoint].x,
//                          -[self bounds].size.height * [[self layer] anchorPoint].y);
//
//    [[self layer] renderInContext:context];
//    CGContextRestoreGState(context);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}

@end
