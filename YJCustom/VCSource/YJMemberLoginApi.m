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
    return @"http://120.76.242.182/dekora_api/o2o/joylaa/login/memberLogin";
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

-(BOOL)loginSuccess
{
    NSDictionary *dict = self.responseJSONObject;
    NSNumber *number = dict[@"success"];
    return number.boolValue;
}

-(NSString*)errorMessage
{
    NSDictionary *dict = self.responseJSONObject;
    id string = dict[@"msg"];
    if ([string isKindOfClass:[NSNull class]]) {
        string = @"账号或密码错误";
    }
    
    return string;
}

@end
