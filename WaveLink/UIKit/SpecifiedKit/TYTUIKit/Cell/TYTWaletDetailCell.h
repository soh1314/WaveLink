//
//  TYTWaletDetailCell.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyBaseCell.h"
#import "TYTBill.h"

@interface TYTWaletDetailCell : EasyBaseCell

@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *tytContentLabel;
@property (nonatomic,strong)UILabel *moneyLabel;

- (void)setBillInfo:(TYTBill *)bill;

@end
