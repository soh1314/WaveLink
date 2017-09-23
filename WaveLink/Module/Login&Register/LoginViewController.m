//
//  LoginViewController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)initUI {
    self.phoneNumBgView.clipsToBounds = YES;
    self.phoneNumBgView.layer.cornerRadius = 36*KRATIO/2.0;
    [self.phoneNumBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(36*KRATIO);
    }];
    [self.verifyBtn setTitleColor:[UIColor themeColor] forState:UIControlStateNormal];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleTextfieldResponser:)];
    [self.view addGestureRecognizer:tap];
}

- (void)cancleTextfieldResponser:(UIGestureRecognizer *)tap {
    [self.phoneTtf resignFirstResponder];
    [self.verifyCodeTtf resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)WXLogin:(id)sender {
    NSLog(@"微信登录按钮点击");
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"everLogin"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)normalLogin:(id)sender {
    NSLog(@"普通登录按钮点击");
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"everLogin"];
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
