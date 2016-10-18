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
        _allOrderListArray = [NSMutableArray array];
        _reservedListArray = [NSMutableArray array];
        _untreatedListArray = [NSMutableArray array];
        
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

-(NSMutableArray *)allOrderListArray
{
    return _allOrderListArray;
}

-(NSMutableArray *)reservedListArray
{
    return _reservedListArray;
}

-(NSMutableArray *)untreatedListArray
{
    return _untreatedListArray;
}


@end
