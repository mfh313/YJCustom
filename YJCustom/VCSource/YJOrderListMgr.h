//
//  YJOrderListMgr.h
//  YJCustom
//
//  Created by EEKA on 16/9/22.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMService.h"

@protocol YJOrderListMgrDelegate <NSObject>

@optional


@end

@interface YJOrderListMgr : MMService
{
    NSMutableDictionary *_orderListDic;
}

@property (nonatomic,weak) id<YJOrderListMgrDelegate> delegate;

-(NSMutableArray *)allServeItemList;

-(NSMutableArray *)orderListArrayForKey:(NSString *)key;
-(void)setOrderListArrayForKey:(NSString *)key array:(NSMutableArray *)array;

-(void)setAllOrderListArray:(NSMutableArray *)array;
-(NSMutableArray *)allOrderListArray;


@end
