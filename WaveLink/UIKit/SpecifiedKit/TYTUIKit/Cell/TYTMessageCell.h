//
//  TYTMessageCell.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyBaseCell.h"
#import "Message.h"

typedef void(^TapCellBlock)(NSString *url);

@interface TYTMessageCell : EasyBaseCell

@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *tytContentLabel;
@property (nonatomic,strong)UIButton *tapButton;
@property (nonatomic,strong)UIImageView *leftImageView;
@property (nonatomic,copy)TapCellBlock tapblock;
@property (nonatomic,strong)UILabel *detailLabel;
@property (nonatomic,assign)NSInteger type; // 0 通知  1活动

- (void)setMessage:(Message *)message;

@end
