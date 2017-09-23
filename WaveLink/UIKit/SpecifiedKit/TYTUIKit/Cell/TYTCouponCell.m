//
//  TYTCouponCell.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTCouponCell.h"

@implementation TYTCouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initUI];
    // Initialization code
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self initUI];
//    }
//    return self;
//}

- (void)initUI {
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    self.backgroundColor = [UIColor whiteColor];
    self.actionBtn.backgroundColor = [UIColor whiteColor];
    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(26*KRATIO);
    }];
    self.actionBtn.clipsToBounds = YES;
    self.actionBtn.layer.cornerRadius = 26*KRATIO/2.0;
    [self.actionBtn setTitleColor:[TYTBonusLink colorLinkBonusStatus:1] forState:UIControlStateNormal];
}

- (void)setInfo:(NSDictionary *)info {
    NSLog(@"set cell");
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
