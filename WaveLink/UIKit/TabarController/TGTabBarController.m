//
//  TGTabBarController.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "TGTabBarController.h"
#import "TGTabBarSubViewController.h"
#import "LoginViewController.h"

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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *everLogin = [[NSUserDefaults standardUserDefaults]objectForKey:@"everLogin"];
    if (!everLogin) {
        LoginViewController *login = [[LoginViewController alloc]init];
        [self presentViewController:login animated:NO completion:nil];
    }
}

- (void)setUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor redColor];
    self.tabBar.translucent = NO;
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
    homeNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_tantan image:[UIImage qsImageNamed:@"tantan_tab"] selectedImage:[UIImage qsImageNamed:@"tantan_tab_t"]];
    RedPacketController *redpackt = [[RedPacketController alloc]init];
    TGNavigationCotroller *redpacktNav = [[TGNavigationCotroller alloc]initWithRootViewController:redpackt];
    redpacktNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldFont4]};
    redpacktNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_redPacket image:[UIImage qsImageNamed:@"red_tab"] selectedImage:[UIImage qsImageNamed:@"red_tab_t"]  ];
    RaffleTicketController *ticket = [[RaffleTicketController alloc]init];
    TGNavigationCotroller *ticketNav = [[TGNavigationCotroller alloc]initWithRootViewController:ticket];
    ticketNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_raffleTicket image:[UIImage qsImageNamed:@"voucher_tab"]  selectedImage:[UIImage qsImageNamed:@"voucher_tab_t"] ];
    ticketNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldFont4]};
    UserCenterController *me = [[UserCenterController alloc]init];
    TGNavigationCotroller *meNav = [[TGNavigationCotroller alloc]initWithRootViewController:me];
    meNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:tabbar_my image:[UIImage qsImageNamed:@"my_tab"]  selectedImage:[UIImage qsImageNamed:@"my_tab_t"]  ];
    self.viewControllers = @[homeNav,redpacktNav,ticketNav,meNav];
}

#pragma mark - TabBarController Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"tgtabarcontroller did select controller : %@",viewController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
