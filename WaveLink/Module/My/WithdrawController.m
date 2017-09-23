//
//  WithdrawController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "WithdrawController.h"

@interface WithdrawController ()

@end

@implementation WithdrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    [self addBackNavItem];
    self.topBgView.backgroundColor = [UIColor colorWithHex:@"#FBFBFB"];
    [self masonLayout];
}

- (void)masonLayout {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)transferSure:(id)sender {
}
@end
