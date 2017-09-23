//
//  TYTMessageCell.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTMessageCell.h"

@implementation TYTMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.timeLabel];
    [self addSubview:self.tytContentLabel];
    [self addSubview:self.leftImageView];
    [self addSubview:self.tapButton];
    [self addSubview:self.detailLabel];
    
    [self setUIStyle];
    [self masonLayout];
}

- (void)setUIStyle {
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.font = [UIFont font2];
    self.tytContentLabel.textColor = [UIColor lightGrayColor];
    self.tytContentLabel.font = [UIFont font3];
    self.detailLabel.textColor = [UIColor lightGrayColor];
    self.detailLabel.font = [UIFont font3];
    
    [self.tapButton setTitleColor:[UIColor themeRedColor] forState:UIControlStateNormal];
    self.tapButton.layer.borderColor = [UIColor themeRedColor].CGColor;
    self.tapButton.layer.borderWidth = 0.5;
    self.tapButton.clipsToBounds = YES;
    self.tapButton.layer.cornerRadius = 24*KRATIO/2.0;
    self.tapButton.titleLabel.font = [UIFont font2];
    
}

- (void)masonLayout {
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self.tytContentLabel.mas_bottom).mas_offset(10*KRATIO);
    }];
    
    [self.tytContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self).mas_offset(10*KRATIO);
    }];
    
    [self.tapButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-1*KCELLLEFTPADDING);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(24*KRATIO);
        make.width.mas_equalTo(72);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(KCELLLEFTPADDING);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10*KRATIO);
        make.right.mas_equalTo(self).mas_offset(-1*KCELLLEFTPADDING);

    }];
    if (self.type == 0) {
        [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(KCELLLEFTPADDING);
            make.top.mas_equalTo(self.tytContentLabel.mas_bottom).mas_offset(10*KRATIO);
        }];
    } else {
        [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(-1*KCELLLEFTPADDING);
            make.centerY.mas_equalTo(self.tytContentLabel);
        }];
    }
    
}

- (void)layoutSubviews {

    [self masonLayout];
}


- (void)setMessage:(Message *)message {
    self.tytContentLabel.text = [NSString stringWithFormat:@"%@",message.body];
    self.timeLabel.text = [NSString stringWithFormat:@"%@",message.createdate];
    self.detailLabel.text = [NSString stringWithFormat:@"%@",message.detailMsg];
    self.type = message.type;
    if (self.type == 0) {
        self.leftImageView.image = [UIImage qsImageNamed:@"news_information_ic"];
        self.tapButton.hidden = NO;
        self.detailLabel.hidden = YES;
    } else {
        self.leftImageView.image = [UIImage qsImageNamed:@"news_activity_ic"];
        self.tapButton.hidden = YES;
        self.detailLabel.hidden = NO;
    }
   
}

- (void)refreshLayout:(NSInteger)type {
 
}

- (void)getMoney:(id)sender {
    NSLog(@"点击领奖");
    if (self.tapblock) {
        self.tapblock(nil);
    }
}

#pragma mark - lazy load

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

- (UIButton *)tapButton {
    if (!_tapButton) {
        _tapButton = [UIButton new];
        [_tapButton setTitle:@"点击领奖" forState:UIControlStateNormal];
        [_tapButton addTarget:self action:@selector(getMoney:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
    }
    return _leftImageView;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
    }
    return _detailLabel;
}

@end
