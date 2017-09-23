//
//  TYTBgTopView.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTBgTopView.h"
#import "UIView+Additions.h"

@implementation TYTBgTopView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}


- (void)initUI {
    [self addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.notiImageView];
    [self.bgImageView addSubview:self.statusLabel];
    [self.bgImageView addSubview:self.contentLabel];
    [self setUIStyle];
    [self massonLayout];
}

- (void)setUIStyle {
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    
}

- (void)massonLayout {
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self);
    }];
    [self.notiImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(-20*KRATIO);
    }];
    
    
}

#pragma mark - lazy load

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
    }
    return _bgImageView;
}

- (UIImageView *)notiImageView {
    if (!_notiImageView) {
        _notiImageView = [UIImageView new];
    }
    return _notiImageView;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
    }
    return _statusLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
    }
    return _contentLabel;
}


@end
