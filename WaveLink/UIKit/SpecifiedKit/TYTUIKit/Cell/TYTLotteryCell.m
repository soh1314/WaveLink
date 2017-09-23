
//
//  TYTLotteryCell.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/12.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTLotteryCell.h"
#import "TYTBonus.h"

@implementation TYTLotteryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)setInfo:(NSDictionary *)info {
    self.ticketNameLabel.text  = @"360运动抽奖劵";
    self.timeLabel.text = @"2017-6-12 09:20";
    self.moneyValueLabel.text = @"10";
    self.moneyFuhaoLabel.text = @"¥";
    
}

- (void)setBonus:(TYTBonus *)bonus {
    _bonus = bonus;
    [self setStatus:bonus.bonusStatus];
    self.ticketNameLabel.text  = self.bonus.name;
    self.timeLabel.text = self.bonus.createdate;
    self.moneyValueLabel.text = @"10";
    self.moneyFuhaoLabel.text = @"¥";
}

- (void)setStatus:(NSInteger)status {
    [self.actionBtn setTitle:[TYTBonusLink textLinkBonusStatus:status] forState:UIControlStateNormal];
    [self.actionBtn setBackgroundColor:[TYTBonusLink colorLinkBonusStatus:status]];
}

- (void)initUI {
    [self addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.topView];
    [self.bgImageView addSubview:self.bottomView];
    
    [self.topView addSubview:self.moneyFuhaoLabel];
    [self.topView addSubview:self.moneyValueLabel];
    [self.topView addSubview:self.ticketSourceImageView];
    
    [self.bottomView addSubview:self.ticketNameLabel];
    [self.bottomView addSubview:self.ticketUrlIcon];
    [self.bottomView addSubview:self.timeLabel];
    [self.bottomView addSubview:self.timeIcon];
    [self.bottomView addSubview:self.actionBtn];
    

    [self setUIStyle];
    [self massonLayout];
    
    [self setInfo:nil];// 测试用的。
    [self setStatus:0];
    
}

- (void)setUIStyle {
    self.bgImageView.image = [UIImage qsImageNamed:@"bg_one"];
    self.timeLabel.font = [UIFont font2];
    self.ticketNameLabel.font = [UIFont font2];
    self.moneyValueLabel.font = [UIFont boldFont5];
    self.moneyFuhaoLabel.font = [UIFont font3];
    self.moneyFuhaoLabel.textAlignment = NSTextAlignmentRight;
    self.moneyValueLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.ticketNameLabel.textColor = [UIColor lightGrayColor];
    self.moneyValueLabel.textColor = [UIColor whiteColor];
    self.moneyFuhaoLabel.textColor = [UIColor whiteColor];
    
    self.timeIcon.image = [UIImage qsImageNamed:@"lottery_time_ic"];
    self.ticketUrlIcon.image = [UIImage qsImageNamed:@"lottery_commodity_ic"];
    
    self.actionBtn.titleLabel.textColor = [UIColor whiteColor];
    self.actionBtn.layer.cornerRadius = 17;
    self.actionBtn.clipsToBounds = YES;
    self.actionBtn.titleLabel.font = [UIFont font3];


}

- (void)massonLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(10);
        make.left.mas_equalTo(self).mas_offset(10);
        make.right.mas_equalTo(self).mas_offset(-10);
        make.bottom.mas_equalTo(self).mas_offset(-5);
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.bgImageView);
        make.bottom.mas_equalTo(self.bgImageView.mas_centerY);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.bgImageView);
        make.top.mas_equalTo(self.bgImageView.mas_centerY);
    }];
    
    [self.moneyValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.topView).mas_offset(-1*KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.topView);
        
    }];
    
    [self.moneyFuhaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.moneyValueLabel.mas_left);
        make.bottom.mas_equalTo(self.moneyValueLabel);
    }];
    
    [self.ticketSourceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.topView).mas_offset(KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.topView);
    }];
    
    [self.ticketUrlIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self.bottomView).mas_offset(15);
    }];
    
    [self.timeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self.ticketUrlIcon.mas_bottom).mas_offset(10);
    }];
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeIcon.mas_right).mas_offset(KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.timeIcon);
    }];
    

    [self.ticketNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.ticketUrlIcon.mas_right).mas_offset(KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.ticketUrlIcon);
    }];
    
    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView).mas_equalTo(-1*KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.bottomView);
        make.width.mas_equalTo(98);
        make.height.mas_equalTo(34*KRATIO);
    }];
    self.actionBtn.clipsToBounds = YES;
    self.actionBtn.layer.cornerRadius = 34*KRATIO/2.0;
}

#pragma mark - lazy load
- (UILabel *)ticketNameLabel {
    if (!_ticketNameLabel ) {
        _ticketNameLabel = [UILabel new];
    }
    return _ticketNameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
    }
    return _timeLabel;
}

- (UIImageView *)timeIcon {
    if (!_timeIcon) {
        _timeIcon = [UIImageView new];
    }
    return _timeIcon;
}

- (UIImageView *)ticketUrlIcon {
    if (!_ticketUrlIcon) {
        _ticketUrlIcon = [UIImageView new];
    }
    return _ticketUrlIcon;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
    }
    return _bgImageView ;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    return _bottomView;
}

- (UIImageView *)ticketSourceImageView {
    if (!_ticketSourceImageView) {
        _ticketSourceImageView = [UIImageView new];
    }
    return _ticketSourceImageView;
}

- (UILabel *)moneyValueLabel {
    if (!_moneyValueLabel) {
        _moneyValueLabel = [UILabel new];
    }
    return _moneyValueLabel;
}

- (UILabel *)moneyFuhaoLabel {
    if (!_moneyFuhaoLabel) {
        _moneyFuhaoLabel = [UILabel new];
    }
    return _moneyFuhaoLabel;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
    }
    return _topView;
}

- (UIButton *)actionBtn {
    if (!_actionBtn) {
        _actionBtn = [UIButton new];
    }
    return _actionBtn;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [self.actionBtn setBackgroundColor:[TYTBonusLink colorLinkBonusStatus:0]];

}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self.actionBtn setBackgroundColor:[TYTBonusLink colorLinkBonusStatus:0]];

}

@end
