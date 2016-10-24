//
//  YJAccountLoginControlLogic.m
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJAccountLoginControlLogic.h"
#import "CAppViewControllerManager.h"
#import "YJMemberLoginApi.h"
#import "YJLoginModel.h"
#import "YJAccountMgr.h"
#import "YTKBaseRequest+AnimatingAccessory.h"

@interface YJAccountLoginControlLogic ()

@end

@implementation YJAccountLoginControlLogic

-(void)onUserLoginUserName:(NSString *)userName Pwd:(NSString *)password
{
#ifdef DEBUG
    userName = @"zxa";
    password = @"111111";
#else
    
#endif
    
    if (!userName || !password) {
        return;
    }
    
    YJMemberLoginApi *loginApi = [[YJMemberLoginApi alloc] initWithUsername:userName password:password];
    
    __weak typeof(self) weakSelf = self;
    loginApi.animatingText = @"正在登录...";
    loginApi.animatingView = MFAppWindow;
    
    [loginApi startWithCompletionBlockWithSuccess:^(YTKBaseRequest * request) {
        
        YJLoginModel *loginModel = [YJLoginModel MM_modelWithJSON:request.responseJSONObject];
        
        YJAccountMgr *accountMgr = [[MMServiceCenter defaultCenter] getService:[YJAccountMgr class]];
        accountMgr.token = loginModel.token;
        
        if(loginModel.token == nil)
        {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf onFisrtLoginSuccess];
        
    } failure:^(YTKBaseRequest * request) {
        
    }];
    
}

-(void)onFisrtLoginSuccess
{
    [[CAppViewControllerManager getAppViewControllerManager] createOrderListViewController];
}

@end
