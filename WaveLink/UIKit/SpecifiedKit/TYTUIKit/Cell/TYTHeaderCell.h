//
//  TYTHeaderCell.h
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/7.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "EasyBaseCell.h"

@interface TYTHeaderCell : EasyBaseCell

@property (nonatomic,strong)UIImageView *avarta;
@property (nonatomic,strong)UILabel *nicknameLabel;
@property (nonatomic,strong)UILabel *accountLabel;
@property (nonatomic,strong)UILabel *valueLabel;
@property (nonatomic,assign)BOOL showArrow;

- (void)setUserInfo:(NSDictionary *)info;

@end
