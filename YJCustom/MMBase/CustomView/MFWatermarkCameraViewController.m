//
//  MFWatermarkCameraViewController.m
//  YJCustom
//
//  Created by EEKA on 2016/10/25.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFWatermarkCameraViewController.h"

@interface MFWatermarkCameraViewController ()

@end

@implementation MFWatermarkCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.showsCameraControls = NO;
    self.allowsEditing = YES;
    
    UIView *cameraOverlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    cameraOverlayView.backgroundColor = [UIColor clearColor];
    
    UIView *testView = [UIView new];
    testView.frame = CGRectMake(50, 50, 100, 100);
    testView.backgroundColor = [UIColor blueColor];
    [cameraOverlayView addSubview:testView];
    
    self.cameraOverlayView = cameraOverlayView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    [self addSomeElements:viewController];
//}
//
//- (UIView *)findView:(UIView *)aView withName:(NSString *)name {
//    Class cl = [aView class];
//    NSString *desc = [cl description];
//    if ([name isEqualToString:desc]) return aView;
//    for (UIView *view in aView.subviews) {
//        Class cll = [view class];
//        NSString *stringl = [cll description];
//        if ([stringl isEqualToString:name]) {
//            return view;
//        }
//    }
//    return nil;
//}
//
//- (void)addSomeElements:(UIViewController *)viewController {
//    UIView *PLCropOverlay = [self findView:viewController.view withName:@"PLCropOverlay"];
//    UIView *PLCropOverlayBottomBar = [self findView:PLCropOverlay withName:@"PLCropOverlayBottomBar"];
//    UIView *PLCropOverlayPreviewBottomBar = [self findView:PLCropOverlayBottomBar withName:@"PLCropOverlayPreviewBottomBar"];
//    UIButton *userButton = [PLCropOverlayPreviewBottomBar.subviews objectAtIndex:2];
//    
//    UIButton *viewbtn = [[UIButton alloc] init];
//    [viewbtn setTitle:@"保存至相册" forState:UIControlStateNormal];
//    [viewbtn setTitleColor:[UIColor whiteColor] forState:0];
////    viewbtn.backgroundColor = RGB(19, 20, 21);
//    [userButton addSubview:viewbtn];
////    [viewbtn mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.trailing.equalTo(userButton.mas_trailing);
////        make.centerY.equalTo(userButton);
////    }];
//    viewbtn.userInteractionEnabled = NO;
//    
//    //给拍照加点击事件
//    UIView *CMKBottomBar = [self findView:viewController.view withName:@"CMKBottomBar"];
//    UIButton *CMKShutterButton = (UIButton *) [self findView:CMKBottomBar withName:@"CMKShutterButton"];
//    [CMKShutterButton addTarget:self action:@selector(shutterButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    
//    //监听重拍
//    UIButton *resetButton = [PLCropOverlayPreviewBottomBar.subviews objectAtIndex:0];
//    [resetButton addTarget:self action:@selector(resetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//}

@end
