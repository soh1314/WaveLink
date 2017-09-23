//
//  EasyShadowView.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyShadowView.h"

@implementation EasyShadowView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.layer.shadowRadius = 3;//阴影半径，默认3
//    self.clipsToBounds = YES;
//    self.layer.cornerRadius = 1;
}

@end
