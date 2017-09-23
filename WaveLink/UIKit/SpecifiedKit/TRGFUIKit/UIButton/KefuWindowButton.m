//
//  KefuWindowButton.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "KefuWindowButton.h"

@implementation KefuWindowButton

- (instancetype)initWithImage:(NSString *)imageUrl frame:(CGRect )frame action:(KefuBtnActionBlock)action {
    if (self = [super initWithFrame:frame]) {
        _imageUrl = imageUrl;
        [self initUI];
        [self handleAction:action];
        
    }
    return self;
}

- (void)initUI {
    
    if (self.sourceController) {
        [self.sourceController.view addSubview:self];
    }
    [self setBackgroundImage:[UIImage qsAutoImageNamed:self.imageUrl] forState:UIControlStateNormal];
    [self clipsToCircle];
}

- (void)handleAction:(KefuBtnActionBlock)action {
    self.action = action;
    [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)action:(id)sender {
    self.action();
}

- (void)clipsToCircle {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2.0;
}



@end
