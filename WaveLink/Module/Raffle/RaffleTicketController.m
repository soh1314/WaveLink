//
//  RedPacketController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "RaffleTicketController.h"
#import "BaseSortController.h"

#import "RaffleTicketDetailController.h"//兑奖详情
#import "RafflePrizeController.h"//领奖
#import "RaffleOpenController.h" //开奖

#import "TYTBonusDataCell.h"
#import "TYTBonus.h"
#import "TYTLotteryCell.h"

@interface RaffleTicketController ()<BaseSortControllerProtocal,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)BaseSortController *sortController;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger countPerPage;

@end

@implementation RaffleTicketController

- (id)init {
    if (self = [super init]) {
        self.navbarStyle = TYTBlackNavBarStyle;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self loadNewData];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.sortController = [[BaseSortController alloc]init];
    self.sortController.titleArray = @[@"全部",@"待开奖",@"待领奖",@"已完成"];
    self.sortController.coloumCount = 4;
    [self addChildViewController:self.sortController];
    [self.sortController willMoveToParentViewController:self];
    [self.view addSubview:self.sortController.view];
    self.sortController.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.sortController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(0.0);
    }];
}

- (void)loadNewData {
    self.sortController.tableView.delegate = self;
    self.sortController.tableView.dataSource = self;
    self.sortController.sortDelegate = self;
    [self.sortController.tableView registerClass:[TYTLotteryCell class] forCellReuseIdentifier:[TYTLotteryCell uniqueID]];
    NSLog(@"模拟数据");
    for (int i  = 0; i < 20; i++) {
        TYTBonus *bonus = [TYTBonus new];
        bonus.bid = i +1;
        bonus.content = [NSString stringWithFormat:@"%d+%@",i,@"360运动红包"];
        bonus.createdate = @"2017.08.15";
        bonus.bonusType = 1;
        bonus.bonusStatus = i%3;
        [self.dataArray addObject:bonus];
    }
    [self localSave];
    [self.sortController.tableView reloadData];
}

- (void)localSave {
    [TYTBonus clearTable];
    [TYTBonus saveObjects:self.dataArray];
}

- (void)sort:(NSInteger)type {
    NSString *criteria = nil;
    NSArray *sortArray = nil;
    if (type == 0) {
        criteria = [NSString stringWithFormat:@"order by %@ limit %ld offset %d",@"pk",(self.page+1)*10,0];
        sortArray = [TYTBonus findByCriteria:criteria];
        
    } else {
        criteria = [NSString stringWithFormat:@"where bonusStatus = %ld order by %@ limit %ld offset %d",type-1,@"pk",(self.page+1)*10,0];
        sortArray = [TYTBonus findByCriteria:criteria];
        
    }
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:sortArray];
    [self.sortController.tableView reloadData];
}

#pragma mark - lazy load

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - tableview delegate and source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTLotteryCell *cell = [tableView dequeueReusableCellWithIdentifier:[TYTLotteryCell uniqueID] forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 152*KRATIO;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTBonus *bonus = self.dataArray[indexPath.row];
    TYTLotteryCell *bonusCell = (TYTLotteryCell *)cell;
    [bonusCell setBonus:bonus];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    TYTBonus *bonus = self.dataArray[indexPath.row];
    if (bonus.bonusStatus == 0) {
        RaffleTicketDetailController *detailController = [RaffleTicketDetailController new];
        detailController.bonus = bonus;
        kNavPushController(detailController, self);
    } else if (bonus.bonusStatus == 1){
        RaffleOpenController *openPrizeController = [RaffleOpenController new];
        openPrizeController.bonus = bonus;
        kNavPushController(openPrizeController, self);
    } else {
        RafflePrizeController *prizeController = [RafflePrizeController new];
        prizeController.bonus = bonus;
        kNavPushController(prizeController, self)
    }
}

#pragma mark - lazy load

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
