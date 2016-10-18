//
//  YJMemberLoginApi.m
//  YJCustom
//
//  Created by EEKA on 16/9/21.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJMemberLoginApi.h"

@implementation YJMemberLoginApi
{
    NSString *_username;
    NSString *_password;
}

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

-(NSString *)baseUrl
{
    return @"http://test.joylaa.com/joylaa-o2o-api-2.0/o2o/joylaa/login/memberLogin";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"isCode":@"eeka",
             @"userKey":_username,
             @"userPswd":_password
             };
}

@end