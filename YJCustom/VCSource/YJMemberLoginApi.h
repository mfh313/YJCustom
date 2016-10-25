//
//  YJMemberLoginApi.h
//  YJCustom
//
//  Created by EEKA on 16/9/21.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFNetworkRequest.h"

@interface YJMemberLoginApi : MFNetworkRequest

-(id)initWithUsername:(NSString *)username password:(NSString *)password;

-(BOOL)loginSuccess;
-(NSString*)errorMessage;

@end
