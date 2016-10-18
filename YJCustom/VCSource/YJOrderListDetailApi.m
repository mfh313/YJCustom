//
//  YJOrderListDetailApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/27.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListDetailApi.h"

@implementation YJOrderListDetailApi

-(NSString *)baseUrl
{
    return @"http://test.joylaa.com/joylaa-o2o-api-2.0/o2o/joylaa/order/getOrderDtl";
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
