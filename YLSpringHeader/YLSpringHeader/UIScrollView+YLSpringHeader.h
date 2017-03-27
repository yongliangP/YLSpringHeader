//
//  UIScrollView+YLSpringHeader.h
//  YLSpringHeader
//
//  Created by iceMaple on 2017/3/27.
//  Copyright © 2017年 yongliangP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLSpringHeaderView.h"
#define kNavHeight 64
#define kWindowWidth        [UIScreen mainScreen].bounds.size.width
#define kWindowHeight       [UIScreen mainScreen].bounds.size.height

@interface UIScrollView (YLSpringHeader)
@property (nonatomic, weak) YLSpringHeaderView *headerView;
@property (nonatomic, weak) UIVisualEffectView *headerEffectView;
@property (nonatomic, weak) UILabel *titleLabel;

- (void)handleSpringHeadView:(YLSpringHeaderView *)view;
@end
