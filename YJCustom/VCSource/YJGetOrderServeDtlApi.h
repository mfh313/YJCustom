//
//  YJGetOrderServeDtlApi.h
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFNetworkRequest.h"

//获取定制订单的量体服务某项目的详情

@interface YJGetOrderServeDtlApi : MFNetworkRequest
{
    NSInteger _lineId;
}

@property (nonatomic,assign) NSInteger lineId;


@end
