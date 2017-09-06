//
//  TGTabBarController.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "TGTabBarController.h"
#import "TGTabBarSubViewController.h"


@interface TGTabBarController ()<UITabBarControllerDelegate>

@end

@implementation TGTabBarController

#pragma mark - init

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setSubControllers];
    [self setUI];
    
    
    // Do any additional setup after loading the view.
}

- (void)setUI {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor themeColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

- (void)setSubControllers {
    VoiceLinkingController *home = [[VoiceLinkingController alloc]init];
    TGNavigationCotroller *homeNav = [[TGNavigationCotroller alloc]initWithRootViewController:home];
    homeNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_tantan image:nil tag:0 ];
    BonusController *bonus = [[BonusController alloc]init];
    TGNavigationCotroller *bonusNav = [[TGNavigationCotroller alloc]initWithRootViewController:bonus];
    bonusNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_hongbao image:nil tag:1 ];
    TicketController *ticket = [[TicketController alloc]init];
    TGNavigationCotroller *ticketNav = [[TGNavigationCotroller alloc]initWithRootViewController:ticket];
    ticketNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_ticket image:nil tag:2 ];
    MeController *me = [[MeController alloc]init];
    TGNavigationCotroller *meNav = [[TGNavigationCotroller alloc]initWithRootViewController:me];
    meNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_me image:nil tag:3 ];
    self.viewControllers = @[homeNav,bonusNav,ticketNav,meNav];
}

#pragma mark - TabBarController Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"tgtabarcontroller did select controller : %@",viewController);
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
