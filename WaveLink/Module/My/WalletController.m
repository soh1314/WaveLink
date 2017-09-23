
//
//  WalletController.m
//  WaveLink
//
//  Created by 刘仰清 on 2017/8/31.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "WalletController.h"
#import "WalletDetailController.h"
#import "WithdrawController.h"

@interface WalletController ()

@end

@implementation WalletController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    [self addBackNavItem];
    UIBarButtonItem *detailBtn = [[UIBarButtonItem alloc]initWithTitle:@"明细" style:UIBarButtonItemStylePlain target:self action:@selector(pushDetail:)];
    self.navigationItem.rightBarButtonItem = detailBtn;
    self.withdrawBtn.clipsToBounds = YES;
    self.withdrawBtn.layer.cornerRadius = 20;
    self.withdrawBtn.backgroundColor = [UIColor themeColor];
    [self.withdrawBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
    }];
    
}

- (void)pushDetail:(id)sender {
    WalletDetailController *detaile = [WalletDetailController new];
    kNavPushController(detaile,self);
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

- (IBAction)withDraw:(id)sender {
    WithdrawController *withdraw = [WithdrawController new];
    kNavPushController(withdraw, self);
    NSLog(@"零钱提现");
}
@end
