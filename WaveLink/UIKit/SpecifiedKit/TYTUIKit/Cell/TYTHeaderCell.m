//
//  TYTHeaderCell.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/7.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "TYTHeaderCell.h"

#define kleftpadding 15

@implementation TYTHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self  addSubview:self.avarta];
    [self addSubview:self.nicknameLabel];
    [self addSubview:self.accountLabel];
    [self masonLayout];
    [self setUIStyle];

}

- (void)masonLayout {
    [self.avarta mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).mas_equalTo(kleftpadding);
    }];
    
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.avarta.mas_right).mas_offset(kleftpadding);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-10);
    }];
    
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.avarta.mas_right).mas_offset(kleftpadding);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(10);
    }];
}

- (void)setUIStyle {
    self.nicknameLabel.textColor = [UIColor blackColor];
    self.accountLabel.textColor = [UIColor lightGrayColor];
    self.nicknameLabel.font = [UIFont boldFont3];
    self.accountLabel.font = [UIFont font3];

}

- (void)setUserInfo:(NSDictionary *)info {
    self.nicknameLabel.text = [info objectForKey:@"nickName"];
    if ([info objectForKey:@"account"]) {
        self.accountLabel.text = [NSString stringWithFormat:@"%@%@",@"账号:",[info objectForKey:@"account"]];
    }
    self.avarta.image = [UIImage qsImageNamed:info[@"avatar"]];
    
    self.nicknameLabel.text = @"小雅sdf";
    self.accountLabel.text = @"账号:测试账号";
    self.avarta.image = [UIImage qsAutoImageNamed:@"icon_my_c"];
}

#pragma mark - lazy load

- (UIImageView *)avarta {
    if (!_avarta) {
        _avarta = [UIImageView new];
    }
    return _avarta;
}

- (UILabel *)accountLabel {
    if (!_accountLabel) {
        _accountLabel = [UILabel new];
    }
    return _accountLabel;
}

- (UILabel *)nicknameLabel {
    if (!_nicknameLabel) {
        _nicknameLabel = [UILabel new];
    }
    return _nicknameLabel;
}

@end
