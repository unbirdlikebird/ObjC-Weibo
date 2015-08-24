//
//  HomeCell.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "HomeCell.h"
#import "Macros.h"

@interface HomeCell ()
@property (nonatomic, assign) BOOL didUpdateConstraints;
@property (nonatomic, weak) UIView *originalView;
@property (nonatomic, weak) UIView *functionView;




@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *originalView = [UIView newAutoLayoutView];
        [self.contentView addSubview:originalView];
        self.originalView = originalView;
        
        UIView *functionView = [UIView newAutoLayoutView];
        functionView.backgroundColor = [UIColor cyanColor];
        functionView.height = 20;
        [self.contentView addSubview:functionView];
        self.functionView = functionView;
        
        UIImageView *imageViewProfile = [UIImageView newAutoLayoutView];
        [originalView addSubview:imageViewProfile];
        self.imageViewProfile = imageViewProfile;
        
        UIImageView *imageViewVIP = [UIImageView newAutoLayoutView];
        [originalView addSubview:imageViewVIP];
        self.imageViewVIP = imageViewVIP;
        
        UILabel *labelUserName = [UILabel newAutoLayoutView];
        [originalView addSubview:labelUserName];
        self.labelUserName = labelUserName;
        
        UILabel *labelContent = [UILabel newAutoLayoutView];
        labelContent.numberOfLines = 0;
        [originalView addSubview:labelContent];
        self.labelContent = labelContent;
        
        UILabel *labelTime = [UILabel newAutoLayoutView];
        [originalView addSubview:labelTime];
        self.labelTime = labelTime;

    }
    return self;
}

- (void)updateConstraints {
    if (!self.didUpdateConstraints) {
        [self layoutUIElements];
        self.didUpdateConstraints = YES;
    }
    [super updateConstraints];
}

- (void)layoutUIElements {
    /**
     *  original view
     */
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
        [self.originalView autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
    }];
    [self.originalView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.originalView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
//    [self.originalView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.originalView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    /**
     *  imageview
     */
    [self.imageViewProfile autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kInset];
    [self.imageViewProfile autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kInset];
    [self.imageViewProfile autoSetDimension:ALDimensionWidth toSize:50];
    /**
     *  name label
     */
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
        [self.labelUserName autoSetContentHuggingPriorityForAxis:ALAxisHorizontal];
    }];
    [self.labelUserName autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kInset];
    [self.labelUserName autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.imageViewProfile withOffset:kInset];
    [self.labelUserName autoSetDimension:ALDimensionWidth toSize:kMaxWidth relation:NSLayoutRelationLessThanOrEqual];
    
    [self.labelUserName autoSetDimension:ALDimensionHeight toSize:20.0f];
    /**
     *  time label
     */
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
        [self.labelTime autoSetContentHuggingPriorityForAxis:ALAxisHorizontal];
    }];
    [self.labelTime autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.imageViewProfile withOffset:kInset];
    [self.labelTime autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.imageViewProfile];
    [self.labelTime autoSetDimension:ALDimensionWidth toSize:150 relation:NSLayoutRelationLessThanOrEqual];
    
    /**
     *  text label
     */
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{

        [self.labelContent autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
    }];
    [self.labelContent autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageViewProfile withOffset:kInset];
    [self.labelContent autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kInset];
    [self.labelContent autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kInset];
    [self.labelContent autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kInset];
    /**
     *  function view
     */
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
        [self.functionView autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
    }];
    [self.functionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.originalView];
    [self.functionView autoSetDimension:ALDimensionHeight toSize:30.0f];
    [self.functionView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kInset];
    [self.functionView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kInset];
    [self.functionView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kInset];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
