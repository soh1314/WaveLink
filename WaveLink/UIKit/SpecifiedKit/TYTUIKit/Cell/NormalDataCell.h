//
//  NormalDataCell.h
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/7.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "EasyBaseCell.h"
#import "CellModel.h"

@interface NormalDataCell : EasyBaseCell

@property (nonatomic,strong)CellModel *model;

- (void)setModel:(CellModel *)model;

@end
