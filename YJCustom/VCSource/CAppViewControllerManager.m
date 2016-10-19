//
//  CAppViewControllerManager.m
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "CAppViewControllerManager.h"
#import "YJOrderListViewController.h"
#import "MMSettingViewController.h"
#import "MMTabBarController.h"
#import "YJAccountLoginControlLogic.h"
#import "YJAccountBaseViewController.h"

@interface CAppViewControllerManager ()
{
    YJOrderListViewController *m_orderListVC;
    
    YJAccountLoginControlLogic *m_loginLogic;
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
    rootNav.tabBarItem.title = @"主页";
    [rootNav setNavigationBarHidden:YES animated:NO];
    
    
    UIStoryboard *settingStoryboard = [UIStoryboard storyboardWithName:@"Setting" bundle:nil];
    MMSettingViewController *settingVC = [settingStoryboard instantiateViewControllerWithIdentifier:@"MMSettingViewController"];
    MMNavigationController *settingRootNav = [[MMNavigationController alloc] initWithRootViewController:settingVC];
    settingRootNav.tabBarItem.title = @"我";

    m_tabbarController = [self getTabBarController];
    m_tabbarController.viewControllers = @[rootNav,settingRootNav];
    
    m_window.rootViewController = m_tabbarController;
}

+ (id)getTabBarController
{
    return [[self getAppViewControllerManager] getTabBarController];
}

- (id)getTabBarController
{
    if (!m_tabbarController) {
        m_tabbarController = [[MMTabBarController alloc] init];
    }
    
    return m_tabbarController;
}

- (void)moveToRootViewController
{
    
}

- (void)moveToRootViewControllerForIndex:(NSInteger)index
{
    
}

-(void)jumpToLoginViewController
{
    if (m_tabbarController.viewControllers) {
        m_tabbarController.viewControllers = nil;
    }
    
    [[MMServiceCenter defaultCenter] removeService:[YJAccountMgr class]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YJAccountBaseViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"YJAccountBaseViewController"];
    
    m_loginLogic = [YJAccountLoginControlLogic new];
    loginVC.m_delegate = m_loginLogic;
    
    m_window.rootViewController  = loginVC;
}

@end
