//
//  VoiceLinkingController.h
//  WaveLink
//
//  Created by 刘仰清 on 2017/8/31.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"

#import "VoiceLockedController.h"
@interface VoiceLinkingController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *adsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketLabel;
@property (weak, nonatomic) IBOutlet UILabel *withDrawLabel;
@property (weak, nonatomic) IBOutlet UILabel *adsNotiLabel;
@property (weak, nonatomic) IBOutlet UILabel *withDrawNotiLabel;
@property (weak, nonatomic) IBOutlet UILabel *voucherNotiLabel;

@property (weak, nonatomic) IBOutlet UIImageView *logonImageView;

@end
