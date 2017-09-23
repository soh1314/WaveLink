//
//  EasyActionBtn.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyActionBtn.h"

@implementation EasyActionBtn

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = [UIColor themeColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont font4];
    self.clipsToBounds = YES;
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40*KRATIO);
    }];
    self.layer.cornerRadius = 40*KRATIO/2.0;
}

@end
