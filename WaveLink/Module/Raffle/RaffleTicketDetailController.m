//
//  RaffleTicketDetailController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "RaffleTicketDetailController.h"

#import "EasyActionBtn.h"
#import "EaseTableView.h"
#import "TYTBgTopView.h"
#import "TYTCouponCell.h"

@interface RaffleTicketDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)EaseTableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)EasyActionBtn *useTicketBtn;
@property (nonatomic,strong)UILabel *notiLabel;
@property (nonatomic,strong)TYTBgTopView *headerView;

@end

@implementation RaffleTicketDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    self.automaticallyAdjustsScrollViewInsets  = NO;
    self.navbarStyle = TYTWhiteNavBarStyle;
    [self.view addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    self.tableView.userInteractionEnabled = NO;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.useTicketBtn];
    [self.view addSubview:self.notiLabel];
    [self.view addSubview:self.headerView];
    [self setUIStyle];
    [self massonLayout];
}

- (void)setUIStyle {
    self.headerView.bgImageView.image = [UIImage qsImageNamed:@"bg_ticket_detail"];
    self.notiLabel.text = @"说明:中奖劵只能有兑奖营业员点击兑换,个人请勿点击"; self.notiLabel.font = [UIFont font2]; self.notiLabel.textColor = [UIColor lightGrayColor];
    self.notiLabel.textAlignment = NSTextAlignmentCenter;
    [self.useTicketBtn setTitle:@"立即使用" forState:UIControlStateNormal];
    [self.useTicketBtn addTarget:self action:@selector(useTicket:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)massonLayout {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo((KSCREENH-KNAVBARHEIGHT)/2.0);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(152*KRATIO);
        
    }];
    
    [self.useTicketBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.tableView).mas_offset(-1*KCELLLEFTPADDING);
        make.left.mas_equalTo(self.tableView).mas_offset(1*KCELLLEFTPADDING);
        make.top.mas_equalTo(self.tableView.mas_bottom).mas_offset(15*KRATIO);
        make.height.mas_equalTo(40*KRATIO);
    }];
    
    [self.notiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(30*KRATIO);
    }];
}

- (void)useTicket:(id)sender {
    NSLog(@"使用优惠券");
}

#pragma mark - tableview delegate datasource 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TYTCouponCellID" forIndexPath:indexPath];
    cell.actionBtn.hidden = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 152*KRATIO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma mark - lazy load
- (UILabel *)notiLabel {
    if (!_notiLabel) {
        _notiLabel = [UILabel new];
    }
    return _notiLabel;
}

- (EasyActionBtn *)useTicketBtn {
    if (!_useTicketBtn) {
        _useTicketBtn = [EasyActionBtn new];
    }
    return _useTicketBtn;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (EaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[EaseTableView alloc]init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"TYTCouponCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TYTCouponCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (TYTBgTopView *)headerView {
    if (!_headerView){
        _headerView = [TYTBgTopView new];
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
