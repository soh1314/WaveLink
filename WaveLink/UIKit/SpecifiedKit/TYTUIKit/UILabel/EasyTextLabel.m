//
//  EasyTextLabel.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "EasyTextLabel.h"

@implementation EasyTextLabel

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.textColor = [UIColor themeTextBlackColor];

}

@end
