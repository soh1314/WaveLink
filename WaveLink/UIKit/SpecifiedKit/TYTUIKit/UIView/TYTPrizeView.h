//
//  TYTPrizeView.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/15.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTPrizeView : UIView

@property (nonatomic,strong)UIImageView* prizeImageView;
@property (nonatomic,strong)UILabel* validityLabel;
@property (nonatomic,strong)UILabel* addressLabel;
@property (nonatomic,strong)UILabel* prizeNameLabel;
@property (nonatomic,strong)UILabel* moneyLabel;
@property (nonatomic,strong)UIImageView* tagImageView;
@property (nonatomic,copy)NSArray* tagArray;
@property (nonatomic,strong)UIView *bgView;

- (void)setInfo:(NSDictionary *)info;

@end
