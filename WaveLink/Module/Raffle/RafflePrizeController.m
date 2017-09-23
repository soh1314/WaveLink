//
//  RafflePrizeController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "RafflePrizeController.h"
#import "RaffleTicketDetailController.h"

#import "TYTBgTopView.h"
#import "TYTPrizeView.h"
#import "UIView+Additions.h"
#import "EasyActionBtn.h"

@interface RafflePrizeController ()
@property (nonatomic,strong)TYTBgTopView *topView;
@property (nonatomic,strong)TYTPrizeView *prizeView;
@property (nonatomic,strong)EasyActionBtn *useBtn;
@end

@implementation RafflePrizeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadNewData];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadNewData {
    [self.prizeView setInfo:nil];
}

- (void)initUI {
    self.navbarStyle = TYTWhiteNavBarStyle;
    [self.view addSubview:self.prizeView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.useBtn];
    [self setUIStyle];
    [self massonLayout];
}

- (void)setUIStyle {
    self.topView.bgImageView.image = [UIImage qsImageNamed:@"bg_ticket_detail"];
    [self.useBtn setTitle:@"免费兑换" forState:UIControlStateNormal];
    [self.useBtn addTarget:self action:@selector(useTicket:) forControlEvents:UIControlEventTouchUpInside];
    self.useBtn.layer.cornerRadius = 20*KRATIO;
}

- (void)massonLayout {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(KSCREENH/3.0);
    }];
    [self.prizeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.mas_bottom).mas_offset(20*KRATIO);
        make.centerX.mas_equalTo(self.topView);
        make.left.mas_equalTo(self.topView).mas_offset(38*KRATIO);
        make.height.mas_equalTo(251);
    }];
    
    [self.useBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(63*KRATIO);
        make.top.mas_equalTo(self.prizeView.mas_bottom).mas_offset(20*KRATIO);
        make.height.mas_equalTo(40*KRATIO);
        make.centerX.mas_equalTo(self.view);
    }];
    
}

- (void)useTicket:(id)sender {
    RaffleTicketDetailController *vc = [[RaffleTicketDetailController alloc]init];
    kNavPushController(vc, self);
}

#pragma mark - lazy load


- (TYTBgTopView *)topView
{
    if(!_topView)
    {
        _topView=[[TYTBgTopView alloc]init];
    }
    return _topView;
}

- (TYTPrizeView *)prizeView
{
    if(!_prizeView)
    {
        _prizeView=[[TYTPrizeView alloc]init];
    }
    return _prizeView;
}

- (EasyActionBtn *)useBtn {
    if (!_useBtn) {
        _useBtn = [[EasyActionBtn alloc]init];
    }
    return _useBtn;
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
