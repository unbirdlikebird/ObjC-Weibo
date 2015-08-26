//
//  StatusFrame.h
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 26/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Status.h"

@interface StatusFrame : NSObject

@property (nonatomic, strong) Status *status;

@property (nonatomic, assign) CGRect viewOriginalFrame;
@property (nonatomic, assign) CGRect imageViewProfileFrame;
@property (nonatomic, assign) CGRect labelNameFrame;
@property (nonatomic, assign) CGRect imageViewVipIconFrame;
@property (nonatomic, assign) CGRect labelTimeFrame;
@property (nonatomic, assign) CGRect labelSourceFrame;
@property (nonatomic, assign) CGRect labelContentFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@end
