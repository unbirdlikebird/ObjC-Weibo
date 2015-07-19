//
//  DJTabBar.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 17/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "DJTabBar.h"
#import "Macros.h"

@interface DJTabBar()
@property (strong, nonatomic)   UIButton     *buttonCenter;
@end
@implementation DJTabBar

- (UIButton *)buttonCenter{
    if (!_buttonCenter) {
        _buttonCenter = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonCenter setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_buttonCenter setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
        [_buttonCenter setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        _buttonCenter.layer.borderColor = [UIColor redColor].CGColor;
//        _buttonCenter.layer.borderWidth = 1.0;
        [_buttonCenter setFrame:CGRectMake(0, 0, 50, 50)];
    }
    return _buttonCenter;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = SCREEN_WIDTH / 5;
    
    for(int index = 0, indexOfSubView = 0; index < self.subviews.count; index++){
        
        UIView *subview = self.subviews[index];
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            subview.x = indexOfSubView * width;
            subview.width = width;
            indexOfSubView++;
        }
        
        if (indexOfSubView == 2) {
            
            [self addSubview:self.buttonCenter];
            self.buttonCenter.centerX = self.centerX;
            self.buttonCenter.width = width;
            indexOfSubView++;
        }
    }
}

@end
