//
//  YJOrderListMgr.m
//  YJCustom
//
//  Created by EEKA on 16/9/22.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListMgr.h"
#import "YJAccountMgr.h"
#import "YJOrderListDataItem.h"
#import "YJOrderServeListItem.h"
#import "YJGetAllServeItemListApi.h"

@interface YJOrderListMgr ()
{
    YJGetAllServeItemListApi *_allServeItemListApi;
    NSMutableArray *_allServeItemList;
}

@end


@implementation YJOrderListMgr

-(instancetype)init
{
    self = [super init];
    if (self) {
        _orderListDic = [NSMutableDictionary dictionary];
        [self getAllServeItemList];
    }
    
    return self;
}

-(void)getAllServeItemList
{
    if (_allServeItemList == nil) {
        _allServeItemList = [NSMutableArray array];
    }
    [_allServeItemList removeAllObjects];
    
    _allServeItemListApi = [YJGetAllServeItemListApi new];
    [_allServeItemListApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSMutableDictionary *response = request.responseJSONObject;

        NSMutableArray *listModelArray = response[@"data"];
        for (int i = 0; i < listModelArray.count; i++) {
            YJAllServeItemListModel *model = [YJAllServeItemListModel MM_modelWithDictionary:listModelArray[i]];
            [_allServeItemList addObject:model];
        }
        NSLog(@"_allServeItemList=%@",_allServeItemList);
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

-(NSMutableArray *)allServeItemList
{
    return _allServeItemList;
}

-(NSMutableArray *)orderListArrayForKey:(NSString *)key
{
    return _orderListDic[key];
}

-(void)setOrderListArrayForKey:(NSString *)key array:(NSMutableArray *)array
{
    _orderListDic[key] = array;
}

-(void)setAllOrderListArray:(NSMutableArray *)array
{
    [self setOrderListArrayForKey:@"YJOrderListMgr_all" array:array];
}

-(NSMutableArray *)allOrderListArray
{
    return _orderListDic[@"YJOrderListMgr_all"];
}


@end
