//
//  ViewController.m
//  HengStars
//
//  Created by hengfu on 16/2/26.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "ViewController.h"
#import "UMSocial.h"
#import "UMSocialConfig.h"
@interface ViewController ()
@property(nonatomic,strong)NSString *url;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.url = @"www.baidu.com";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)share:(id)sender {
//    [self share];
//    
//}

- (void)share
{
    
    [UMSocialData defaultData].extConfig.qqData.url = self.url;
    [UMSocialData defaultData].extConfig.qzoneData.url = self.url;
    [UMSocialData defaultData].extConfig.qqData.title = @"恒富在线新闻";
    [UMSocialData defaultData].extConfig.qzoneData.title = @"恒富在线新闻";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = self.url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = self.url;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"恒富在线新闻";
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"恒富在线新闻";
    
    NSString *baseStr=@"恒富在线是你的财富挖掘机，最低1元起投，年化收益10%以上，采用严密的第三方托管。理财够安全，赚钱更轻松！";
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56d6575667e58eacc80011e8"
                                      shareText:[baseStr stringByAppendingString:self.url]
                                     shareImage:[UIImage imageNamed:@"fuzai_share.jpg"]
                                shareToSnsNames:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToTencent,UMShareToEmail,UMShareToSms,UMShareToFacebook,UMShareToTwitter]
                                       delegate:nil];
    [UMSocialData defaultData].extConfig.smsData.shareImage=nil;
    
    
}

@end
