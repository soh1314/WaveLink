//
//  MessageController.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "MessageController.h"
#import "TYTMessageCell.h"
#import "BaseSortController.h"
#import "RafflePrizeController.h"

@interface MessageController ()<BaseSortControllerProtocal,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)BaseSortController *sortController;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger countPerPage;

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadNewData];
    [self sort:0]; // 默认是0
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.sortController = [[BaseSortController alloc]init];
    self.sortController.titleArray = @[@"通知",@"活动"];
    self.sortController.coloumCount = 2;
    [self addChildViewController:self.sortController];
    [self.sortController willMoveToParentViewController:self];
    [self.view addSubview:self.sortController.view];
    [self.sortController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(0.0);
    }];
    
}

- (void)loadNewData {
    self.sortController.tableView.delegate = self;
    self.sortController.tableView.dataSource = self;
    self.sortController.sortDelegate = self;
    [self.sortController.tableView registerClass:[TYTMessageCell class] forCellReuseIdentifier:[TYTMessageCell uniqueID]];
    [self.dataArray removeAllObjects];
    NSLog(@"模拟数据");
    for (int i = 0; i < 20; i++) {
        Message *message = [Message new];
        message.body = @"红包多少钱";
        message.createdate = @"1988.0.0343";
        message.type = i%2;
        message.detailMsg = @"这个广告很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长";
        [self.dataArray addObject:message];
    }
    [self localSave];
    [self.sortController.tableView reloadData];
}

- (void)localSave {
    [Message clearTable];
    [Message saveObjects:self.dataArray];
}

- (void)sort:(NSInteger)type {
    NSString *criteria = nil;
    NSArray *sortArray = nil;
    criteria = [NSString stringWithFormat:@"where type = %ld order by %@ desc limit %ld offset %d",type,@"pk",(self.page+1)*10,0];
    sortArray = [Message findByCriteria:criteria];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[TYTMessageCell uniqueID] forIndexPath:indexPath];
    Message *message = self.dataArray[indexPath.row];
    __weak typeof(self)weakself = self;
    [cell setTapblock:^(NSString *url){
        RafflePrizeController *prizeController = [RafflePrizeController new];
        kNavPushController(prizeController, weakself);
        
    }];
    [cell setMessage:message];
    return cell;
}

#pragma mark - tableview delegate and source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68*KRATIO;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
