//
//  UITabBarController+Start.m
//  HengStars
//
//  Created by hengfu on 16/4/28.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "UITabBarController+Start.h"
#import "ADManager.h"
@implementation UITabBarController (Start)
- (void)setADView
{
    //设置启动页面
    [ADManager loadLatestAdImage];
    UIView *adView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImageView *adImage = [[UIImageView alloc] init];
    UIImageView *adBottomImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"adBottom.png" ]];
    [adView addSubview:adBottomImg];
    [adView addSubview:adImage];
    adBottomImg.frame = CGRectMake(0, SCREEN_HEIGHT - 135, SCREEN_WIDTH, 135) ;
    adImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-135);
    if ([ADManager isShouldDisplayAd]) {
        adImage.image = [ADManager getAdImage];
    }else{
        adImage.backgroundColor = RGBAlpha(246, 246, 246, 1);
    }
    adView.alpha = 0.99f;
    [self.view addSubview:adView];
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
    [UIView animateWithDuration:3 animations:^{
        adView.alpha =1.0f;
    } completion:^(BOOL finished) {
        //[[UIApplication sharedApplication] setStatusBarHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            adView.alpha = 0.0f;
        }completion:^(BOOL finished) {
            [adView removeFromSuperview];
            //self.navigationController.navigationBarHidden = NO;
        }];
    }];

}

- (void)setPTabBarItem
{
//    UITabBarItem *item=[[UITabBarItem alloc] initWithTitle:@"主页" image:[UIImage imageNamed:@"zhuye"] selectedImage:[UIImage imageNamed:@"zhuye_h"]];
//    UITabBarItem *item1=[[UITabBarItem alloc] initWithTitle:@"富仔理财" image:[[UIImage imageNamed:@"fuzai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"fuzai_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    UITabBarItem *item2=[[UITabBarItem alloc] initWithTitle:@"富仔小屋" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home_h"]];
//    UITabBarItem *item3=[[UITabBarItem alloc] initWithTitle:@"富仔社区" image:[UIImage imageNamed:@"shequ"] selectedImage:[UIImage imageNamed:@"shequ_h"]];
//    UITabBarItem *item4=[[UITabBarItem alloc] initWithTitle:@"富仔社区" image:[UIImage imageNamed:@"shequ"] selectedImage:[UIImage imageNamed:@"shequ_h"]];
    //self.v
   //UITabBarItem *item=[[UITabBarItem alloc] initWithTitle:@"故事" image:[UIImage imageNamed:@"icon_gushi_weixuanzhong"] selectedImage:[UIImage imageNamed:@"icon_gushi_xuanzhong"]];

    //设置tabBarItem的字体点击颜色
    UIColor *titleHighlightedColor = [UIColor colorWithRed:0x09/255.0 green:0xbb/255.0 blue:0x07/255.0 alpha:1.0];
    //UIColor *titleHighlightedColor = [UIColor blueColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleHighlightedColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];

}
@end
