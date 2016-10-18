//
//  YJAccountBaseViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/19.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJAccountBaseViewController.h"

@interface YJAccountBaseViewController () <UITextFieldDelegate>
{
    __weak IBOutlet UITextField *_userNameTextField;
    
    __weak IBOutlet UITextField *_passwordTextField;
    
    __weak IBOutlet UIButton *_loginBtn;
}

@end

@implementation YJAccountBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickLoginBtn:(id)sender
{
    if ([self.m_delegate respondsToSelector:@selector(onUserLoginUserName:Pwd:)]) {
        [self.m_delegate onUserLoginUserName:_userNameTextField.text Pwd:_passwordTextField.text];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
