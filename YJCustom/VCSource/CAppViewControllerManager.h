//
//  CAppViewControllerManager.h
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMTabBarController.h"


@interface CAppViewControllerManager : NSObject <UITabBarControllerDelegate>
{
    UIWindow *m_window;
    
    NSMutableArray *m_arrViewController;
    NSMutableArray *m_arrTabBarBaseViewController;
    MMTabBarController *m_tabbarController;
}

-(id)initWithWindow:(UIWindow *)window;
+(id)getAppViewControllerManager;
+(id)getTabBarController;

-(void)createOrderListViewController;

-(void)jumpToLoginViewController;

@end
