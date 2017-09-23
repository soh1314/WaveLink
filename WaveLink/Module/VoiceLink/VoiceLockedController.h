//
//  VoiceLockedController.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/15.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"
#import "EasyActionBtn.h"
@interface VoiceLockedController : BaseViewController
@property (weak, nonatomic) IBOutlet EasyActionBtn *reLock;
- (IBAction)relock:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgTopImageView;

@end
