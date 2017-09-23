//
//  WithdrawController.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"
#import "EasyActionBtn.h"
#import "EasyTextLabel.h"
@interface WithdrawController : BaseViewController
@property (weak, nonatomic) IBOutlet EasyActionBtn *sureBtn;
@property (weak, nonatomic) IBOutlet EasyTextLabel *targetWXAccountLabel;
@property (weak, nonatomic) IBOutlet EasyTextLabel *withdrawMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainMoneyLabel;
- (IBAction)transferSure:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *topBgView;

@end
