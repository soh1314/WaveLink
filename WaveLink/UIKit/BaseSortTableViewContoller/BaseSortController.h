//
//  BaseSortController.h
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/6.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "BaseViewController.h"

@protocol BaseSortControllerProtocal <NSObject>

- (void)loadNewData;
- (void)sort:(NSInteger)type;

@end

@interface BaseSortController : BaseViewController<BaseSortControllerProtocal>

@property (nonatomic,strong)EaseTableView *tableView;
@property (nonatomic,assign)NSInteger coloumCount;
@property (nonatomic,copy)NSArray *titleArray;
@property (nonatomic,assign)NSInteger sortType;
@property (nonatomic,weak)id <BaseSortControllerProtocal>sortDelegate;


@end
