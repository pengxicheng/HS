//
//  UIViewController+SetNavigationBar.m
//  HengStars
//
//  Created by hengfu on 16/5/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "UIViewController+SetNavigationBar.h"
#import "UIColor+CreateImage.h"
@implementation UIViewController (SetNavigationBar)

-(void)setNavigationBar
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{ NSFontAttributeName : [UIFont systemFontOfSize:19],
        NSForegroundColorAttributeName : UIColorFromRGB(0x000000)}];
    self.navigationController.navigationBar.barTintColor =  UIColorFromRGB(0xFFD749);
    [self.navigationController.navigationBar setBackgroundImage:[UIColorFromRGB(0xFFD749) imageWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIColorFromRGB(0xFFD749) imageWithFrame:CGRectMake(0, 0, 10, 2)]];//取出底部黑线
    
}

-(void)setNavigationBarClear
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{ NSFontAttributeName : [UIFont systemFontOfSize:19],
        NSForegroundColorAttributeName : [UIColor clearColor] }];
    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIColor clearColor] imageWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIColor clearColor] imageWithFrame:CGRectMake(0, 0, 10, 10)]];//取出底部黑线

}
@end
