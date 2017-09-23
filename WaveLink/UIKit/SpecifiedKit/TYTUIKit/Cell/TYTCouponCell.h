//
//  TYTCouponCell.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyActionBtn.h"
#import "TYTBonus.h"

@interface TYTCouponCell : UITableViewCell

@property (weak, nonatomic) IBOutlet EasyActionBtn *actionBtn;
@property (weak, nonatomic) IBOutlet UILabel *moneyValueLabel;

- (void)setInfo:(NSDictionary *)info;

@end
