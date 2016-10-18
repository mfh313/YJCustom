//
//  CAppViewControllerManager.h
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMTabBarController.h"


@interface CAppViewControllerManager : NSObject
{
    UIWindow *m_window;
    
    MMTabBarController *m_tabbarController;
}

-(id)initWithWindow:(UIWindow *)window;
+(id)getAppViewControllerManager;

-(void)createOrderListViewController;

@end
