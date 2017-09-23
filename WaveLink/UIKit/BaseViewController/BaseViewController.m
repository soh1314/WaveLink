//
//  BaseViewController.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/5.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.navigationController) {
        [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"answer_back_ic"];
        [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"answer_back_ic"];
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    }
    self.title = [self easyTittle:kBundleId];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navbarStyle == TYTBlackNavBarStyle) {
        [self setBlackNavBar];
    } else {
        [self setWhiteTrasluntNavBar];
    }
  
   
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
   
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
