//
//  GetRedPacketController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "GetRedPacketController.h"
#import "UIView+Additions.h"
#import "AdvertisementController.h"

@interface GetRedPacketController ()

@end

@implementation GetRedPacketController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    self.notiLabel.textColor = [UIColor themeColor];
//    self.avartImageView.clipsToBounds = YES;
//    self.avartImageView.layer.cornerRadius = 40;
    self.avartImageView.image = [UIImage imageNamed:@"wallet_bag_ic"];
    self.moneyAccountLabel.font = [UIFont systemFontOfSize:40*KRATIO];
    
    [self.topContainerView addShadow];
    [self.avartImageView clipsToCircle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)useTicket:(id)sender {
    NSLog(@"使用红包");
    AdvertisementController *advertise = [[AdvertisementController alloc]init];
    [self.navigationController pushViewController:advertise animated:YES];
}
@end
