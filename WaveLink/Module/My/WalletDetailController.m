//
//  WalletDetailController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "WalletDetailController.h"
#import "BillDetailController.h"

#import "TYTWaletDetailCell.h"
#import "TYTBill.h"

@interface WalletDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)EaseTableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation WalletDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    [self addBackNavItem];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadNewData];
}

- (void)loadNewData {
    [self.dataArray removeAllObjects];
    for (int i = 0; i < 20; i++) {
        TYTBill *bill = [TYTBill new];
        bill.content = @"红包多少钱";
        bill.createdate = @"1988.0.0343";
        bill.money = @"5.0";
        [self.dataArray addObject:bill];
    }
    [self.tableView reloadData];
}

#pragma mark - lazy load

- (EaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[EaseTableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TYTWaletDetailCell class] forCellReuseIdentifier:[TYTWaletDetailCell uniqueID]];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - tableview delegate and source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTWaletDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[TYTWaletDetailCell uniqueID] forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60*KRATIO;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTBill *bill = self.dataArray[indexPath.row];
    TYTWaletDetailCell *detailCell = (TYTWaletDetailCell *)cell;
    [detailCell setBillInfo:bill];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    BillDetailController *detailController = [BillDetailController new];
    kNavPushController(detailController, self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
