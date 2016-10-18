//
//  YJOrderListReservedViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListReservedViewController.h"

@interface YJOrderListReservedViewController ()
{
    YJOrderListApi *_reservedOrderListApi;
    NSMutableArray *_reservedListArray;
}

@end

@implementation YJOrderListReservedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _reservedListArray = [NSMutableArray array];
//    
//    _reservedOrderListApi = [YJOrderListApi new];
//    _reservedOrderListApi.limit = 1;
//    _reservedOrderListApi.progress = @"AS";
//    [self getOrderListReserved];
}

//-(void)getOrderListReserved
//{
//    __weak typeof(self) weakSelf = self;
//    
//    [_reservedOrderListApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        
//        [_reservedListArray removeAllObjects];
//        
//        NSMutableDictionary *response = request.responseJSONObject;
//        
//        NSMutableArray *dataArray = response[@"data"];
//        for (int i = 0; i < dataArray.count; i++) {
//            YJOrderListDataItem *dataItem = [YJOrderListDataItem MM_modelWithDictionary:dataArray[i]];
//            
//            [_reservedListArray addObject:dataItem];
//        }
//        
//        YJOrderListMgr* m_orderListMgr = [[MMServiceCenter defaultCenter] getService:[YJOrderListMgr class]];
//        m_orderListMgr.reservedListArray = _reservedListArray;
//        
//        
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        
//        
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
