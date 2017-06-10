//
//  ViewController.m
//  GPUImageVideoCamera
//
//  Created by wsk on 17/6/10.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"
@interface ViewController (){
    GPUImageVideoCamera *videoCamera;
    GPUImageOutput<GPUImageInput> *filter;
}


@end

@implementation ViewController

/*
 美颜相机--视频篇
 */
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)takePhotoAction:(UIButton *)sender {
    
    videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    videoCamera.horizontallyMirrorFrontFacingCamera = NO;
    videoCamera.horizontallyMirrorRearFacingCamera = NO;
    
    filter = [[GPUImageColorInvertFilter alloc] init];
    
    [videoCamera addTarget:filter];
    GPUImageView *filterView = (GPUImageView *)self.view;
    
    [filter addTarget:filterView];
    [videoCamera startCameraCapture];
}

@end
