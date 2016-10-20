//
//  YJGetOrderServerApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJGetOrderServerApi.h"

@implementation YJGetOrderServerApi

-(NSString *)baseUrl
{
    return @"http://120.76.242.182/dekora_api/o2o/joylaa/order/getOrderServe";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    YJAccountMgr *accountMgr =[[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
    NSString *token = accountMgr.token;
    
    params[@"access_token"] = token;
    params[@"order_num"] = _orderNum;
    
    return params;
}

@end
