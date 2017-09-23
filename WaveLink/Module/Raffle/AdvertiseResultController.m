//
//  AdvertiseResultController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "AdvertiseResultController.h"
#import "GetRedPacketController.h"
#import "GetCouponController.h"

@interface AdvertiseResultController ()

@end

@implementation AdvertiseResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)initUI {
    [self setUIStyle];
    [self massonLayout];
}

- (void)setUIStyle {
    self.adsContentLabel.textColor = [UIColor whiteColor];
    if (self.type == 0) {
        [self.getPrizeBtn setBackgroundColor:[UIColor colorWithHex:@"#f067b4"]];
        self.resultImageView.image = [UIImage qsImageNamed:@"thelottery_redpack_ic"];
        self.adsTitleLabel.textColor = [UIColor colorWithHex:@"#f067b4"];
        
    } else {
        [self.getPrizeBtn setBackgroundColor:[UIColor themeColor]];
        self.resultImageView.image = [UIImage qsImageNamed:@"Coupons_raffle tickets_bg"];
        self.adsTitleLabel.textColor = [UIColor themeColor];
    }
}

- (void)massonLayout {
    [self.getPrizeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40*KRATIO);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 领取广告答案奖励 - 红包和抽奖劵

- (IBAction)getAward:(id)sender {
    if (self.type == 0) {
        GetRedPacketController *vc = [GetRedPacketController new];
        kNavPushController(vc, self);
    } else {
        GetCouponController *vc = [GetCouponController new];
        kNavPushController(vc, self);
    }
}
@end
