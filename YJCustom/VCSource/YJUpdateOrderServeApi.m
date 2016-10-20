//
//  YJUpdateOrderServeApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJUpdateOrderServeApi.h"

@implementation YJUpdateOrderServeApi

-(NSString *)baseUrl
{
    return @"http://120.76.242.182/dekora_api/o2o/joylaa/order/updateOrderServe";
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
    params[@"serve_content"] = _serveContent;
    
    return params;
}

@end
