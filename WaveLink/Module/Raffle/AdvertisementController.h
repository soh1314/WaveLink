//
//  AdvertisementController.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"

@interface AdvertisementController : BaseViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,assign)NSInteger type;
@property (weak, nonatomic) IBOutlet UIView *questionBgView;
@property (nonatomic,copy)NSString *url;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webviewHeight;

@end
