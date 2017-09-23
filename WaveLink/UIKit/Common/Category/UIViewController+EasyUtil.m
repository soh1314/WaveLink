//
//  UIViewController+EasyUtil.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "UIViewController+EasyUtil.h"
#import "MessageController.h"

@implementation UIViewController (EasyUtil)

- (NSString *)easyTittle:(NSString *)project {
    NSDictionary *tytDic =@{
                             @"CouponController":@"优惠劵",
                             @"UIViewController":@"默认",
                             @"SettingController":@"设置",
                             @"WalletController":@"钱包",
                             @"RaffleTicketController":@"抽奖券",
                             @"MessageController":@"消息",
                             @"FootPrintController":@"足迹",
                             @"WalletDetailController":@"钱包明细",
                             @"VoiceLinkingController":@"声动宝",
                             @"VoiceLinkedController":@"声动宝",
                             @"RedPacketController":@"红包",
                             @"BillDetailController":@"账单明细",
                             @"RaffleTicketDetailController":@"奖券详情",
                             @"WithdrawController":@"提现",
                             @"GetCouponController":@"领劵",
                             @"GetRedPacketController":@"领取红包",
                             };
    
    NSString *controllerName = NSStringFromClass(self.class);
    return [tytDic objectForKey:controllerName];
}

- (void)addLeftMessageItem {
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc]initWithImage:[UIImage qsAutoImageNamed:@"coupon_news_ic"] style:UIBarButtonItemStylePlain target:self action:@selector(pushToMessageController:)];
    self.navigationItem.leftBarButtonItem = messageItem;
}

- (void)addBackNavItem {
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc]initWithImage:[UIImage qsAutoImageNamed:@"answer_back_ic"] style:UIBarButtonItemStylePlain target:self action:@selector(backToLastPopViewController:)];
    self.navigationItem.leftBarButtonItem = messageItem;
}

- (void)backToLastPopViewController:(id)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)pushToMessageController:(id)sender {
    MessageController *message = [MessageController new];
    kNavPushController(message, self);
}

- (void)setWhiteTrasluntNavBar {
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    self.jz_navigationBarBackgroundAlpha = 0.0;
    self.jz_wantsNavigationBarVisible = YES;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldFont4]};
}

- (void)setBlackNavBar {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    self.jz_navigationBarBackgroundAlpha = 1;
    self.jz_wantsNavigationBarVisible = YES;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldFont4]};
    
}



@end
