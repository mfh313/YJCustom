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
    NSMutableArray *_allOrderListArray;
    NSMutableArray *_reservedListArray;
    NSMutableArray *_untreatedListArray;
}

@property (nonatomic,weak) id<YJOrderListMgrDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *allOrderListArray;
@property (nonatomic,strong) NSMutableArray *reservedListArray;
@property (nonatomic,strong) NSMutableArray *untreatedListArray;

-(NSMutableArray *)allServeItemList;


@end
