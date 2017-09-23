//
//  TYTPrizeView.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/15.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTPrizeView.h"
#import "UIView+Additions.h"

@interface TYTPrizeView ()
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIView *lineView;
@property (nonatomic,strong)UIImageView *dashLineView;

@end

@implementation TYTPrizeView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)setInfo:(NSDictionary *)info {
    self.prizeNameLabel.text = @"360限量版360度无敌超级保温杯";
    self.moneyLabel.text = @"¥30";
    self.addressLabel.text = @"厦门天河区保利麓谷中心一层多少楼";
    self.validityLabel.text = @"2017-8-9 10:20 -  2017-8-9 10:20 ";
    self.prizeImageView.image = [UIImage imageNamed:@"Coupons_raffle tickets_bg"];
    [self addTagViewArray:@[@"环保",@"便洁",@"大容量"]];
}

- (void)addTagViewArray:(NSArray *)titleArray {
    for (int i = 0; i < titleArray.count; i++) {
        UILabel *tag = [UILabel new];
        [self addSubview:tag];
        tag.font = [UIFont font2];
        tag.text = [NSString stringWithFormat:@"%@",titleArray[i]];
        tag.textColor = [UIColor lightGrayColor];
        tag.layer.borderWidth = 1/KSCREENSCALE;
        tag.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [tag mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.prizeNameLabel.mas_bottom).mas_offset(15);
            make.left.mas_equalTo(self.prizeNameLabel).mas_offset(15*i+50*i);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        tag.textAlignment = NSTextAlignmentCenter;
        tag.clipsToBounds = YES;
        tag.layer.cornerRadius = 20/2.0;
        
    }
}

- (void)initUI {
    self.backgroundColor = [UIColor lightGrayColor];
    [self addShadow];
    [self addSubview:self.bgView];
    [self addSubview:self.topView];
    [self addSubview:self.bottomView];
    [self addSubview:self.lineView];
    [self.topView addSubview:self.prizeNameLabel];
    [self.bottomView addSubview:self.addressLabel];
    [self.topView addSubview:self.moneyLabel];
    [self.topView addSubview:self.prizeImageView];
    [self.bottomView addSubview:self.validityLabel];
    [self.topView addSubview:self.tagImageView];
    [self addSubview:self.dashLineView];
    [self massonLayout];
    [self setUIStyle];
}

- (void)massonLayout {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(self).multipliedBy(2/3.0f);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.top.mas_equalTo(self.topView.mas_bottom);
    }];
    
    [self.prizeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView).mas_offset(20*KRATIO);
        make.right.mas_equalTo(self.topView.mas_centerX);
        make.height.width.mas_equalTo(78*KRATIO);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.topView.mas_centerX).mas_offset(14*KRATIO);
        make.bottom.mas_equalTo(self.prizeImageView).mas_offset(-10);
    }];
    
    [self.prizeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.topView);
        make.top.mas_equalTo(self.prizeImageView.mas_bottom).mas_offset(20*KRATIO);
    }];
    
    [self.validityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView).mas_offset(15*KRATIO);
        make.left.mas_equalTo(self.bottomView).mas_offset(16);
        make.centerX.mas_equalTo(self.bottomView);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.validityLabel.mas_bottom).mas_offset(7*KRATIO);
        make.left.mas_equalTo(self.bottomView).mas_offset(16);
        make.centerX.mas_equalTo(self.bottomView);
    }];
    
    [self.dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(15);
        make.top.mas_equalTo(self.bottomView);
        make.height.mas_equalTo(1/KSCREENSCALE);
        make.centerX.mas_equalTo(self);
    }];
    
    
}

- (void)setUIStyle {
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.moneyLabel.textAlignment = NSTextAlignmentLeft;
    self.addressLabel.textAlignment = NSTextAlignmentCenter;
    self.validityLabel.textAlignment = NSTextAlignmentCenter;
    self.prizeNameLabel.textAlignment = NSTextAlignmentCenter;
    
    self.addressLabel.textColor = [UIColor themeTextBlackColor];
    self.validityLabel.textColor = [UIColor themeTextBlackColor];
    self.prizeNameLabel.textColor = [UIColor themeTextBlackColor];
    self.prizeNameLabel.font = [UIFont systemFontOfSize:13];
    self.validityLabel.font = [UIFont font2];
    self.addressLabel.font = [UIFont font2];
    
    self.dashLineView.image = [self dashlineImageWithLineWithImageView:self.dashLineView];
    self.dashLineView.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - lazyload
- (UIView *)topView
{
    if(!_topView)
    {
        _topView=[[UIView alloc]init];
    }
    return _topView;
}

- (UIView *)bottomView
{
    if(!_bottomView)
    {
        _bottomView=[[UIView alloc]init];
    }
    return _bottomView;
}

- (UIView *)lineView
{
    if(!_lineView)
    {
        _lineView=[[UIView alloc]init];
    }
    return _lineView;
}


- (UIImageView *)prizeImageView
{
    if(!_prizeImageView)
    {
        _prizeImageView=[[UIImageView alloc]init];
    }
    return _prizeImageView;
}

- (UILabel *)validityLabel
{
    if(!_validityLabel)
    {
        _validityLabel=[[UILabel alloc]init];
    }
    return _validityLabel;
}

- (UILabel *)addressLabel
{
    if(!_addressLabel)
    {
        _addressLabel=[[UILabel alloc]init];
    }
    return _addressLabel;
}

- (UILabel *)prizeNameLabel
{
    if(!_prizeNameLabel)
    {
        _prizeNameLabel=[[UILabel alloc]init];
    }
    return _prizeNameLabel;
}

- (UILabel *)moneyLabel
{
    if(!_moneyLabel)
    {
        _moneyLabel=[[UILabel alloc]init];
    }
    return _moneyLabel;
}

- (UIImageView *)tagImageView
{
    if(!_tagImageView)
    {
        _tagImageView=[[UIImageView alloc]init];
    }
    return _tagImageView;
}

- (NSArray *)tagArray
{
    if(!_tagArray)
    {
        _tagArray=[[NSArray alloc]init];
    }
    return _tagArray;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
    }
    return _bgView;
}

- (UIImageView *)dashLineView {
    if (!_dashLineView) {
        _dashLineView = [[UIImageView alloc]init];
    }
    return _dashLineView;
}

@end
