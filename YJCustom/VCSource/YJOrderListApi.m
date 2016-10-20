//
//  YJOrderListApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/27.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListApi.h"
#import "YJAccountMgr.h"

@implementation YJOrderListApi
{
    
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _page = 1;
        _limit = 15;
    }
    
    return self;
}

-(NSString *)baseUrl
{
    return @"http://120.76.242.182/dekora_api/o2o/joylaa/order/getOrderList";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    YJAccountMgr *accountMgr =[[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
    NSString *token = accountMgr.token;
    
    params[@"access_token"] = token;
    params[@"is_made"] = @"T";
    params[@"page"] = @(_page);
    params[@"limit"] = @(_limit);
    if (_progress) {
        params[@"progress"] = _progress;
    }
    
    return params;
}

-(id)jsonValidator
{
    return @{@"data":[NSArray class]};
}

//-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary
//{
//    YJAccountMgr *accountMgr =[[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
//    NSString *token = accountMgr.token;
//    
//    return @{@"access_token":token};
//}

@end
