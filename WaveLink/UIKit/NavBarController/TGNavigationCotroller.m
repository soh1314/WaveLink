//
//  TGNavigationCotroller.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "TGNavigationCotroller.h"


@interface TGNavigationCotroller ()

@end

@implementation TGNavigationCotroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.backgroundColor = [UIColor themeColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = [UIColor themeColor];
    // Do any additional setup after loading the view.
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

@end
