//
//  EaseTableView.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/6.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "EaseTableView.h"

@implementation EaseTableView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.showsVerticalScrollIndicator = NO;
        self.tableFooterView = [[UIView alloc]init];
    }
    return self;
}



@end
