//
//  UILabel+EZLabel.m
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "UILabel+EZLabel.h"

@implementation UILabel (EZLabel)

- (CGSize)ez_contentSize {
    CGSize size = CGSizeZero;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:self.font forKey: NSFontAttributeName];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0
    size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                attributes:attributes
                                   context:nil].size;
#else
    size = [self.text sizeWithFont:self.font
                 constrainedToSize:maxsize
                     lineBreakMode:NSLineBreakByWordWrapping];
#endif
    
    return size;
}

@end
