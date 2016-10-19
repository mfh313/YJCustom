//
//  YJAccountBaseViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/19.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJAccountBaseViewController.h"

@interface YJAccountBaseViewController () <UITextFieldDelegate,UIScrollViewDelegate>
{
    __weak IBOutlet UITableView *_tableView;
    
    __weak IBOutlet UITextField *_userNameTextField;
    
    __weak IBOutlet UITextField *_passwordTextField;
    
    __weak IBOutlet UIButton *_loginBtn;
}

@end

@implementation YJAccountBaseViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardWillShow:(NSNotification *)note
{
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    CGRect loginBtnFrameInSelf = [_loginBtn convertRect:_loginBtn.frame toView:self.view];
    
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    if (CGRectGetMaxY(loginBtnFrameInSelf) > CGRectGetMinY(keyboardBounds))
    {
        CGFloat y = CGRectGetMaxY(loginBtnFrameInSelf) - CGRectGetMinY(keyboardBounds) + 10;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:[duration doubleValue]];
        [UIView setAnimationCurve:[curve intValue]];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        [_tableView setContentInset:UIEdgeInsetsMake(0, 0, y, 0)];
        
        [UIView commitAnimations];
    }
}

- (void)keyboardWillHide:(NSNotification *)note
{
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    [_tableView setContentInset:UIEdgeInsetsZero];
    
    [UIView commitAnimations];
}

- (IBAction)onClickLoginBtn:(id)sender
{
    if ([self.m_delegate respondsToSelector:@selector(onUserLoginUserName:Pwd:)]) {
        [self.m_delegate onUserLoginUserName:_userNameTextField.text Pwd:_passwordTextField.text];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
