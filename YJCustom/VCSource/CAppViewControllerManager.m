//
//  CAppViewControllerManager.m
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "CAppViewControllerManager.h"
#import "YJOrderListViewController.h"

@interface CAppViewControllerManager ()
{
    YJOrderListViewController *m_orderListVC;
}

@end

@implementation CAppViewControllerManager

+ (id)getAppViewControllerManager
{
    static CAppViewControllerManager *_sharedAppViewControllerManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAppViewControllerManager = [[self alloc] init];
    });
    
    return _sharedAppViewControllerManager;
}

-(id)initWithWindow:(UIWindow *)window
{
    self = [[self class] getAppViewControllerManager];
    if (self) {
        m_window = window;
    }
    return self;
}

-(void)createOrderListViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OrderList" bundle:nil];
    m_orderListVC = [storyboard instantiateViewControllerWithIdentifier:@"YJOrderListViewController"];
    
    MMNavigationController *rootNav = [[MMNavigationController alloc] initWithRootViewController:m_orderListVC];
    [rootNav setNavigationBarHidden:YES animated:NO];
    
    m_window.rootViewController = rootNav;
}

@end
