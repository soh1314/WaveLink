//
//  LoginViewController.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *verifyBtn;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;
@property (weak, nonatomic) IBOutlet UIButton *WXLoginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTtf;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTtf;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnHeight;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *phoneNumBgView;

- (IBAction)WXLogin:(id)sender;
- (IBAction)normalLogin:(id)sender;

@end
