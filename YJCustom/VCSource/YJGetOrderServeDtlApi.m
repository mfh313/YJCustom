//
//  YJGetOrderServeDtlApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJGetOrderServeDtlApi.h"

@implementation YJGetOrderServeDtlApi

-(NSString *)baseUrl
{
    return @"http://test.joylaa.com/joylaa-o2o-api-2.0/o2o/joylaa/order/getOrderServeDtl";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    YJAccountMgr *accountMgr =[[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
    NSString *token = accountMgr.token;
    
    params[@"access_token"] = token;
    params[@"line_id"] = @(_lineId);
    
    return params;
}

@end