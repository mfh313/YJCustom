//
//  YJGetAllServeItemListApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJGetAllServeItemListApi.h"

@implementation YJGetAllServeItemListApi

-(NSString *)baseUrl
{
    return @"http://mall.nexy.co/dekora_api/o2o/nexyco/order/getAllServeItemList";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    YJAccountMgr *accountMgr =[[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
    NSString *token = accountMgr.token;
    
    params[@"access_token"] = token;
    
    return params;
}

@end
