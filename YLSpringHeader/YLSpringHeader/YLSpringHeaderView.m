//
//  YLSpringHeaderView.m
//  YLSpringHeader
//
//  Created by iceMaple on 2017/3/27.
//  Copyright © 2017年 yongliangP. All rights reserved.
//

#import "YLSpringHeaderView.h"

@interface YLSpringHeaderView ()

@property (nonatomic, strong) UIVisualEffectView *imageEffectView;
@property (nonatomic, strong) UIImageView *blurImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@end

@implementation YLSpringHeaderView

#pragma mark- Setter
-(void)setHeaderImage:(UIImage *)headerImage
{
    _headerImage = headerImage;
    self.blurImageView.image = headerImage;
}

-(void)setTittle:(NSString *)tittle
{
    _tittle = tittle;
    self.titleLabel.text = tittle;
}


#pragma mark - Getter

-(UIButton *)leftButton
{
    if (!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setImage:[UIImage imageNamed:@"ic_Back_White"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
    }
    return _leftButton;
}

-(UIButton*)rightButton
{
    if (!_rightButton)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setImage:[UIImage imageNamed:@"ic_share_white"] forState:UIControlStateNormal];
        [self addSubview:_rightButton];
    }

    return _rightButton;
}


-(UILabel *)titleLabel
{

    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.alpha = 0;
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}



-(UIImageView *)blurImageView
{
    if (!_blurImageView)
    {
        _blurImageView = [[UIImageView alloc] init];
        _blurImageView.clipsToBounds = YES;
        _blurImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _blurImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_blurImageView];
    }
    
    return _blurImageView;
}


-(UIVisualEffectView *)imageEffectView
{
    
    if (!_imageEffectView)
    {
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _imageEffectView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        _imageEffectView.alpha = 0;
        _imageEffectView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_imageEffectView];
    }
    
    return _imageEffectView;
}


-(void)leftBtnClick:(UIButton*)btn
{

    if (self.leftClickBlock)
    {
        self.leftClickBlock(btn);
    }
}


-(void)rightBtnClick:(UIButton*)btn
{
    if (self.rightClickBlock)
    {
        self.rightClickBlock(btn);
    }
}

-(void)setIsShowLeftButton:(BOOL)isShowLeftButton
{
    _isShowLeftButton = isShowLeftButton;
    if (isShowLeftButton)
    {
        self.leftButton.frame = CGRectMake(5, 20, 40, 40);
    }
}

-(void)setIsShowRightButton:(BOOL)isShowRightButton
{
    _isShowRightButton = isShowRightButton;
    if (isShowRightButton)
    {
        self.rightButton.frame = CGRectMake(self.frame.size.width-50, 20, 40, 40);
    }
}


-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.blurImageView.frame = self.bounds;
    
    self.imageEffectView.frame = self.bounds;
    
    self.titleLabel.frame = CGRectMake(35, 40, self.bounds.size.width-35*2, 44);
    if (self.isShowLeftButton)
    {
        self.leftButton.frame = CGRectMake(5, 20, 40, 40);
    }
    if (self.isShowRightButton)
    {
        self.rightButton.frame = CGRectMake(self.bounds.size.width-50, 20, 40, 40);
    }
    self.clipsToBounds = YES;
}


@end
