//
//  TYTBonusDataCell.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyBaseCell.h"
#import "TYTBonus.h"

@interface TYTBonusDataCell : EasyBaseCell

@property (nonatomic,strong)TYTBonus *bonus;

@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *tytContentLabel;
@property (nonatomic,strong)UILabel *statusLabel;

- (void)setBonus:(TYTBonus *)bonus;

@end
