//
//  TYTWaletDetailCell.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTWaletDetailCell.h"

@implementation TYTWaletDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.moneyLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.tytContentLabel];
    [self setUIStyle];
    [self masonLayout];
}

- (void)setUIStyle {
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.font = [UIFont font2];
    self.tytContentLabel.font = [UIFont font3];
    self.tytContentLabel.textColor = [UIColor themeTextBlackColor];
    self.moneyLabel.font = [UIFont font4];
}

- (void)masonLayout {
    [self.tytContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self).mas_offset(15*KRATIO);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self.tytContentLabel.mas_bottom).mas_offset(7*KRATIO);
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-1*KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}

- (void)setBillInfo:(TYTBill *)bill {
    self.timeLabel.text = [NSString stringWithFormat:@"%@",bill.createdate];
    self.tytContentLabel.text = [NSString stringWithFormat:@"%@",bill.content];
    self.moneyLabel.text = [NSString stringWithFormat:@"%@",bill.money];
    if ([bill.money integerValue] < 0) {
        self.moneyLabel.textColor = [UIColor colorWithHex:@"#fc8282"];
    } else {
        self.moneyLabel.textColor = [UIColor colorWithHex:@"#475061"];
    }
}

#pragma mark - lazy load

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
    }
    return _moneyLabel;
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
