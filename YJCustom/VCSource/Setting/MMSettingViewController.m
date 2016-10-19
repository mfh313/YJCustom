//
//  MMSettingViewController.m
//  YJCustom
//
//  Created by EEKA on 2016/10/19.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMSettingViewController.h"

@interface MMSettingViewController ()

@end

@implementation MMSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickQuitLogin:(id)sender {
    [[CAppViewControllerManager getAppViewControllerManager] jumpToLoginViewController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
