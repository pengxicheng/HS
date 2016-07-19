//
//  NotifyView.m
//  HengFu
//
//  Created by hengfu on 15/9/7.
//  Copyright (c) 2015年 Panda. All rights reserved.
//

#import "XQNotifyView.h"

@implementation XQNotifyView

+ (XQNotifyView *)sharedInstance
{
    static XQNotifyView * view = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        view = [[XQNotifyView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, 64)];
        //view.backgroundColor = UIColorFromRGB(0x265596);
        view.backgroundColor = UIColorFromRGB(0x265596);
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40, 15, view.frame.size.width, 44)];
        label.tag=300;
        UIButton *button=[UIButton buttonWithType:UIButtonTypeInfoDark];
        button.frame=CGRectMake(15, 30, 15, 15);
        button.tintColor=[UIColor whiteColor];
        button.userInteractionEnabled=NO;
        [view addSubview:button];
        [view addSubview:label];
        label.textColor=[UIColor whiteColor];
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    });
    return view;
}

+ (void)showWithText:(NSString *)text
{
    XQNotifyView *view=[XQNotifyView sharedInstance];
    UILabel *label=(UILabel *)[view viewWithTag:300];
    label.text=text;
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.values=[NSArray arrayWithObjects:@0,[NSNumber numberWithFloat:view.frame.size.height],[NSNumber numberWithFloat:view.frame.size.height],@0 ,nil];
    animation.keyTimes=[NSArray arrayWithObjects:@0,@0.2,@0.8,@1, nil];
    animation.duration=2.5;
    animation.removedOnCompletion=YES;
    animation.fillMode=kCAFillModeForwards;
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)showHudWithString:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText=text;
}

+ (void)hideHud
{
    [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow animated:YES];
}
@end
