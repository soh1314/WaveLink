//
//  TYTBonusDataCell.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTBonusDataCell.h"

@implementation TYTBonusDataCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.statusLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.tytContentLabel];
    [self setUIStyle];
    [self masonLayout];
}

- (void)setUIStyle {
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.font = [UIFont font2];
    self.tytContentLabel.font = [UIFont font3];
    self.statusLabel.font = [UIFont font3];
}

- (void)masonLayout {
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self).mas_offset(14*KRATIO);
    }];
    [self.tytContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(KCELLLEFTPADDING);
        make.bottom.mas_equalTo(self).mas_offset(-14*KRATIO);
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-26);
        make.centerY.mas_equalTo(self.tytContentLabel.mas_centerY);
    }];
}

- (void)setBonus:(TYTBonus *)bonus {
    _bonus = bonus;
    self.timeLabel.text = bonus.createdate;
    self.tytContentLabel.text = bonus.content;
    self.statusLabel.text = [TYTBonusLink textLinkBonus:bonus];
    self.statusLabel.textColor = [TYTBonusLink colorLinkBonus:_bonus];
}

#pragma mark - lazy load

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc]init];
    }
    return _statusLabel;
}

- (UILabel *)tytContentLabel {
    if (!_tytContentLabel) {
        _tytContentLabel = [[UILabel alloc]init];
    }
    return _tytContentLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
    }
    return _timeLabel;
}

@end
