//
//  TYTRuffleView.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/15.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTRuffleView : UIView

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UILabel *valueLabel;
@property (nonatomic,strong)UIImageView *companyIconView;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UIImageView *timeIcon;
@property (nonatomic,strong)UIImageView *ruffleIcon;
@property (nonatomic,strong)UILabel *ruffleNameLabel;

- (void)setInfo:(NSDictionary *)info;

@end
