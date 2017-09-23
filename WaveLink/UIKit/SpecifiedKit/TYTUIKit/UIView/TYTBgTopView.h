//
//  TYTBgTopView.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTBgTopView : UIView

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UIImageView *notiImageView;
@property (nonatomic,strong)UILabel *statusLabel;
@property (nonatomic,strong)UILabel *contentLabel;

- (id)initWithFrame:(CGRect)frame;

@end
