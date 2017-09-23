//
//  AdvertiseResultController.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"

@interface AdvertiseResultController : BaseViewController

@property (nonatomic,assign)NSInteger type; // 0 = 红包， 1 = 劵
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;
@property (weak, nonatomic) IBOutlet UILabel *adsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *adsContentLabel;
@property (weak, nonatomic) IBOutlet UIButton *getPrizeBtn;
@property (weak, nonatomic) IBOutlet UILabel *adsResultLabel;
- (IBAction)getAward:(id)sender;

@end
