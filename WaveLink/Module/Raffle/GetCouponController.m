//
//  GetCouponController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "GetCouponController.h"
#import "TYTBgTopView.h"

@interface GetCouponController ()
@property (nonatomic,strong)TYTBgTopView *headerView;
@end

@implementation GetCouponController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)initUI {
    [self.topView addSubview:self.headerView];
    self.headerView.bgImageView.image = [UIImage qsImageNamed:@"bg"];
    self.headerView.notiImageView.image = [UIImage qsImageNamed:@"coupons_success_ic"];
    self.headerView.statusLabel.text = @"领奖成功";
    self.headerView.statusLabel.textColor = [UIColor whiteColor];
    self.headerView.statusLabel.font = [UIFont font3];
    [self setUIStyle];
    [self masonLayout];
}

- (void)setUIStyle {
    self.topViewHeights.constant = 1/3.0*KSCREENH;
}

- (void)masonLayout {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.topView);
    }];
    [self.headerView.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView.notiImageView.mas_bottom).mas_offset(15*KRATIO);
        make.centerX.mas_equalTo(self.headerView);
    }];
}

#pragma mark - lazy load

- (TYTBgTopView *)headerView {
    if (!_headerView) {
        _headerView = [TYTBgTopView new];
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
