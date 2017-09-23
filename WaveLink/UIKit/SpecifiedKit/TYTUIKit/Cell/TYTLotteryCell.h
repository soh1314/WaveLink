//
//  TYTLotteryCell.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/12.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyBaseCell.h"
#import "TYTBonus.h"

@interface TYTLotteryCell : EasyBaseCell

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIImageView *ticketUrlIcon;
@property (nonatomic,strong)UIImageView *timeIcon;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *ticketNameLabel;
@property (nonatomic,strong)UILabel *moneyValueLabel;
@property (nonatomic,strong)UILabel *moneyFuhaoLabel;
@property (nonatomic,strong)UIImageView *ticketSourceImageView;
@property (nonatomic,strong)UIButton *actionBtn;

@property (nonatomic,strong)TYTBonus *bonus;

- (void)setInfo:(NSDictionary *)info;

- (void)setBonus:(TYTBonus *)bonus;

@end
