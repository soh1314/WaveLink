//
//  TYTAnswerCell.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyBaseCell.h"

typedef void(^TapDotActionBlock)(NSString * index);

@interface TYTAdvertisementAnswer : NSObject

@property (nonatomic,copy)NSString *fuhao;
@property (nonatomic,copy)NSString *answer;

@end

@interface TYTAnswerCell : UICollectionViewCell

@property (nonatomic,strong)UIButton *dotBtn;
@property (nonatomic,strong)UILabel *fuhaoLabel;
@property (nonatomic,strong)UILabel *answerLabel;
@property (nonatomic,strong)TYTAdvertisementAnswer *answer;
@property (nonatomic,copy)TapDotActionBlock dotAction;

- (void)setAnswer:(TYTAdvertisementAnswer *)answer;

@end
