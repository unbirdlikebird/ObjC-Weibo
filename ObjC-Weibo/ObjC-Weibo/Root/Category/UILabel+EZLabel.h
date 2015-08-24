//
//  UILabel+EZLabel.h
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (EZLabel)
/**
 *  返回适合内容的size
 */
- (CGSize)ez_contentSize;
@end
