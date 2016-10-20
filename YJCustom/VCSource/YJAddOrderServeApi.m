//
//  YJAddOrderServeApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJAddOrderServeApi.h"

@implementation YJAddOrderServeApi

-(NSString *)baseUrl
{
    return @"http://120.76.242.182/dekora_api/o2o/joylaa/order/addOrderServe";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    YJAccountMgr *accountMgr =[[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
    NSString *token = accountMgr.token;
    
    params[@"access_token"] = token;
    params[@"order_id"] = @(_orderId);
    params[@"prod_id"] = @(_prodId);
    params[@"serve_item"] = _serveItem;
    params[@"serve_content"] = _serveContent;
    
    return params;
}

@end
