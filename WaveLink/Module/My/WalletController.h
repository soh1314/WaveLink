//
//  WalletController.h
//  WaveLink
//
//  Created by 刘仰清 on 2017/8/31.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"

@interface WalletController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *withdrawBtn;

- (IBAction)withDraw:(id)sender;

@end
