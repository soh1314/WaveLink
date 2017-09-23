//
//  GetRedPacketController.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"
#import "EasyActionBtn.h"
@interface GetRedPacketController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *avartImageView;
@property (weak, nonatomic) IBOutlet UILabel *moneyAccountLabel;
@property (weak, nonatomic) IBOutlet EasyActionBtn *userTicketBtn;
@property (weak, nonatomic) IBOutlet UILabel *notiLabel;
@property (weak, nonatomic) IBOutlet UIView *topContainerView;
- (IBAction)useTicket:(id)sender;

@end
