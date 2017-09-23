//
//  TYTRuffleView.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/15.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTRuffleView.h"

@interface TYTRuffleView ()

@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *bottomView;

@end

@implementation TYTRuffleView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)setInfo:(NSDictionary *)info {
    self.bgImageView.image = [UIImage imageNamed:@"bg_one"];
    self.valueLabel.text = @"八折";
}

- (void)initUI {
    [self addSubview:self.bgImageView];
    [self addSubview:self.bottomView];
    [self addSubview:self.topView];
    [self addSubview:self.companyIconView];
    [self addSubview:self.valueLabel];
    [self addSubview:self.timeIcon];
    [self addSubview:self.ruffleNameLabel];
    [self addSubview:self.ruffleIcon];
    [self addSubview:self.timeLabel];
    
    [self massonLayout];
    [self setUIStyle];
}

- (void)setUIStyle {
    self.timeIcon.image = [UIImage qsImageNamed:@"lottery_time_ic"];
    self.ruffleIcon.image = [UIImage qsImageNamed:@"lottery_commodity_ic"];
    self.companyIconView.image = [UIImage imageNamed:@"lottery_commodity_ic"];
    self.ruffleNameLabel.text = @"360运动优惠券";
    self.timeLabel.text = @"2017-09-01 10:20";
    self.timeLabel.font = [UIFont font2];
    self.ruffleNameLabel.font = [UIFont font2];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.ruffleNameLabel.textColor = [UIColor lightGrayColor];
    
}

- (void)massonLayout {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_centerY);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.top.mas_equalTo(self.topView.mas_bottom);
    }];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.companyIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(20);
        make.centerY.mas_equalTo(self.topView);
        
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-20);
        make.centerY.mas_equalTo(self.topView);
    }];
    
    [self.timeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(20);
    }];
    
    [self.ruffleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(20);
    }];
    
    [self.ruffleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.ruffleIcon.mas_right).mas_offset(20);
        make.centerY.mas_equalTo(self.ruffleIcon);
        make.top.mas_equalTo(self.bottomView);
        make.bottom.mas_equalTo(self.bottomView.mas_centerY);

    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeIcon.mas_right).mas_offset(20);
        make.centerY.mas_equalTo(self.timeIcon);
        make.bottom.mas_equalTo(self.bottomView).mas_offset(-10);
        make.top.mas_equalTo(self.ruffleNameLabel.mas_bottom);

    }];
}

#pragma mark - lazy load

- (UIImageView *)bgImageView
{
    if(!_bgImageView)
    {
        _bgImageView=[[UIImageView alloc]init];
    }
    return _bgImageView;
}

- (UILabel *)valueLabel
{
    if(!_valueLabel)
    {
        _valueLabel=[[UILabel alloc]init];
    }
    return _valueLabel;
}

- (UIImageView *)companyIconView
{
    if(!_companyIconView)
    {
        _companyIconView=[[UIImageView alloc]init];
    }
    return _companyIconView;
}

- (UILabel *)timeLabel
{
    if(!_timeLabel)
    {
        _timeLabel=[[UILabel alloc]init];
    }
    return _timeLabel;
}

- (UIImageView *)timeIcon
{
    if(!_timeIcon)
    {
        _timeIcon=[[UIImageView alloc]init];
    }
    return _timeIcon;
}

- (UIImageView *)ruffleIcon
{
    if(!_ruffleIcon)
    {
        _ruffleIcon=[[UIImageView alloc]init];
    }
    return _ruffleIcon;
}

- (UILabel  *)ruffleNameLabel
{
    if(!_ruffleNameLabel)
    {
        _ruffleNameLabel=[[UILabel alloc]init];
    }
    return _ruffleNameLabel;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
    }
    return _topView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    return _bottomView;
}


@end
