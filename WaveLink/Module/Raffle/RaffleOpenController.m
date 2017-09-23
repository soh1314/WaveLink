//
//  RaffleOpenController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "RaffleOpenController.h"
#import "TYTRuffleView.h"
#import "TYTBgTopView.h"
#import "EasyActionBtn.h"

@interface RaffleOpenController ()

@property (nonatomic,strong)TYTBgTopView *topView;
@property(nonatomic,strong)TYTRuffleView *ruffleView;
@property (nonatomic,strong)EasyActionBtn *useBtn;

@end

@implementation RaffleOpenController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)useTicket:(id)sender {
    
}

- (void)initUI {
    [self.view addSubview:self.topView];
    [self.view addSubview:self.ruffleView];
    [self.view addSubview:self.useBtn];
    
    [self setUIStyle];
    [self maslayout];
}

- (void)setUIStyle {
    self.topView.bgImageView.image = [UIImage qsImageNamed:@"bg_ticket_detail"];
    [self.useBtn setTitle:@"立即使用" forState:UIControlStateNormal];
    [self.useBtn addTarget:self action:@selector(useTicket:) forControlEvents:UIControlEventTouchUpInside];
    self.useBtn.layer.cornerRadius = 20*KRATIO;
    [self.ruffleView setInfo:nil];
}

- (void)maslayout {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(KSCREENH/3.0);
    }];

    [self.ruffleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(15);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.topView.mas_bottom).mas_offset(26);
        make.height.mas_equalTo(152*KRATIO);
    }];
    
    [self.useBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(15);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.ruffleView.mas_bottom).mas_offset(26);
        make.height.mas_equalTo(40*KRATIO);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (TYTRuffleView *)ruffleView
{
    if(!_ruffleView)
    {
        _ruffleView=[[TYTRuffleView alloc]init];
    }
    return _ruffleView;
}

- (EasyActionBtn *)useBtn
{
    if(!_useBtn)
    {
        _useBtn=[[EasyActionBtn alloc]init];
    }
    return _useBtn;
}


@end
