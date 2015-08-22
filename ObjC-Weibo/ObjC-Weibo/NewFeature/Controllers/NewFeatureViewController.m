//
//  NewFeatureViewController.m
//  ObjC-Weibo
//
//  Created by Dianyi Jiang on 19/07/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "Macros.h"
#import "RootViewController.h"

@interface NewFeatureViewController()<UIScrollViewDelegate>
@property (weak, nonatomic)   UIPageControl     *pageControl;
@end

@implementation NewFeatureViewController

static const NSInteger NewFeatureCount = 4;

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutNewFeature];
    [self layoutPageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Layout NewFeature

- (void)layoutNewFeature {
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    CGFloat scrollWidth = scrollView.width;
    CGFloat scrollHeight = scrollView.height;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < NewFeatureCount ; i ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.size = CGSizeMake(scrollWidth, scrollHeight);
        imageView.y = 0;
        imageView.x = i * scrollWidth;
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
        if (i == NewFeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }

    scrollView.contentSize = CGSizeMake(NewFeatureCount * scrollWidth, 0);
}

- (void)setupLastImageView:(UIImageView *)imageView {
    imageView.userInteractionEnabled = YES;
    UIButton *buttonShare = [[UIButton alloc]init];
    [buttonShare setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [buttonShare setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [buttonShare setTitle:@"分享给大家" forState:UIControlStateNormal];
    [buttonShare setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonShare.width = 200;
    buttonShare.height = 30;
    buttonShare.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    buttonShare.center = CGPointMake(imageView.width / 2, imageView.height * 0.65);
    [buttonShare addTarget:self action:@selector(buttonShareDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:buttonShare];
    
    UIButton *buttonStart = [[UIButton alloc]init];
    [buttonStart setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [buttonStart setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [buttonStart setTitle:@"开始微博" forState:UIControlStateNormal];
    buttonStart.size = buttonStart.currentBackgroundImage.size;
    buttonStart.width = 150;
    buttonStart.center = CGPointMake(imageView.width / 2, imageView.height * 0.75);
    [buttonStart addTarget:self action:@selector(buttonStartDidClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:buttonStart];
}

- (void)buttonShareDidClick:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

- (void)buttonStartDidClick {
    UIWindow *windows = [UIApplication sharedApplication].keyWindow;
    windows.rootViewController = [[RootViewController alloc] init];
}

- (void)layoutPageControl {
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 50);
    pageControl.numberOfPages = NewFeatureCount;
    pageControl.currentPageIndicatorTintColor= RGBCOLOR(253, 98, 42);
    pageControl.pageIndicatorTintColor = RGBCOLOR(189, 189, 189);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int currentPage = (int)scrollView.contentOffset.x / scrollView.width + 0.5;
    self.pageControl.currentPage = currentPage;
}


@end
