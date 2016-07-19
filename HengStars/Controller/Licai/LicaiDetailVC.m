//
//  LicaiDetailVC.m
//  HengStars
//
//  Created by hengfu on 16/3/4.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "LicaiDetailVC.h"
#import "FullViewController.h"
#import "FMGVideoPlayView.h"
#import "CFDanmakuView.h"
#import "UIImageView+WebCache.h"
#import "UIColor+CreateImage.h"
#import "UMSocial.h"
#import "UMSocialConfig.h"
@interface LicaiDetailVC ()<CFDanmakuDelegate,FMGVideoPlayViewDelegate>
@property(nonatomic,strong)NSString *url;
@property (weak, nonatomic) IBOutlet UIView *videoBg;//播放器背景图，到时里面可以放个背景图
//播放器
@property(nonatomic,strong)FMGVideoPlayView *fmVideoPlayer;
 
//全屏幕控制器
@property(nonatomic,strong)FullViewController *fullVc;

//播放按钮
@property(nonatomic,strong)UIButton *playButton;

//播放器下面的图
@property(nonatomic,strong)UIImageView *playImageV;

@property(nonatomic, assign)BOOL isFullViewController;
//控制器各按钮
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//电影标题

@property (weak, nonatomic) IBOutlet UIImageView *stateImage;//众筹状态

@property (weak, nonatomic) IBOutlet UILabel *biaoqianLabel;//项目标签

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;//影视类别

@property (weak, nonatomic) IBOutlet UILabel *kaijiTime;//开机时间

@property (weak, nonatomic) IBOutlet UILabel *shangyingTime;//上映时间

@property (weak, nonatomic) IBOutlet UILabel *rongziNum;//融资金额
@property (weak, nonatomic) IBOutlet UILabel *zhipianCompany;//制片公司
@property (weak, nonatomic) IBOutlet UILabel *chupingCompany;//出品公司

@end

@implementation LicaiDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.

    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.hidesBottomBarWhenPushed=YES;
    
    //创建播放器
    [self setNavigationBarClear];
    self.fmVideoPlayer = [FMGVideoPlayView videoPlayView];
    self.fmVideoPlayer.delegate = self;
    self.isFullViewController = NO;

    [self.playButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.videoBg addSubview:self.playImageV];
    [self.videoBg addSubview:self.playButton];
    
    self.url = @"www.baidu.com";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBarClear];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (_fmVideoPlayer.player) {
        [_fmVideoPlayer.player pause];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark response 按钮事件
- (IBAction)backClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//项目分享
- (IBAction)shareClick:(id)sender {
    [UMSocialData defaultData].extConfig.qqData.url = self.url;
    [UMSocialData defaultData].extConfig.qzoneData.url = self.url;
    [UMSocialData defaultData].extConfig.qqData.title = @"恒星计划新闻";
    [UMSocialData defaultData].extConfig.qzoneData.title = @"恒星计划新闻";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = self.url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = self.url;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"恒星计划新闻";
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"恒星计划新闻";
    
    NSString *baseStr=@"恒星计划，年轻化、娱乐化得影视众筹平台！";
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56d6575667e58eacc80011e8"
                                      shareText:[baseStr stringByAppendingString:self.url]
                                     shareImage:[UIImage imageNamed:@"fuzai_share.jpg"]
                                shareToSnsNames:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina]
                                       delegate:nil];
    [UMSocialData defaultData].extConfig.smsData.shareImage=nil;
}

//项目详情
- (IBAction)xiangmuDetail:(id)sender {
    
}
//投资方案
- (IBAction)touziFangan:(id)sender {
    
}
//投资
- (IBAction)touziClick:(id)sender {
    
}
//投资记录
- (IBAction)touziJilu:(id)sender {
    
}
//投资问答
- (IBAction)touziWenda:(id)sender {
    
}
#pragma mark delegate FMGVideoPlayViewDelegate 全屏切换
-(void)videoplayViewSwitchOrientation:(BOOL)isFull
{
    self.isFullViewController = isFull;
    if (isFull) {
        [self.navigationController presentViewController:self.fullVc animated:NO completion:^{
            [self.fullVc.view addSubview:self.fmVideoPlayer];
            _fmVideoPlayer.frame = self.fullVc.view.bounds;
            self.fmVideoPlayer.danmakuView.frame = self.fmVideoPlayer.frame;
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                _fmVideoPlayer.frame = self.fullVc.view.bounds;
                self.fmVideoPlayer.danmakuView.frame = self.fmVideoPlayer.frame;
                [self.fmVideoPlayer.player play];
            } completion:nil];
        }];
        
    }else{
        [self.fullVc dismissViewControllerAnimated:NO completion:^{
            [self.videoBg addSubview:_fmVideoPlayer];
            _fmVideoPlayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*9/16);
            [self.fmVideoPlayer.player play];
        }];
    
    }

}
#pragma mark button delegate
-(void)playButtonAction:(UIButton*)sender
{
    //检测是否有网
    //检测网络测试,到时所有网络请求之前检测下网络状态
    if (![CoreStatus isNETWORKEnable]) {
        [XQNotifyView showWithText:@"网络未连接"];
        return;
    }
//    if ([self.imageURL isEqualToString:@"2"]) {
//        
//        [_fmVideoPlayer setUrlString:@"http://www.stars999.com/css/wpnzb.mp4"];
//    }
//    else{
//         [_fmVideoPlayer setUrlString:@"http://www.stars999.com/css/wdhyszz.mp4"];
//    }
    [_fmVideoPlayer setUrlString:@"http://v.jxvdy.com/sendfile/cp7p7JXCqE1zOXcrWhFuVkG2p2lPp2gExTrw8_It2jJ26UnymTSN-8z_Nw9DzW0wakHeilfB3OA4d40Y3fa0PYuO9bKTgA"];
    _fmVideoPlayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*9/16);
    //_fmVideoPlayer.center = self.view.center;
    [self.videoBg addSubview:_fmVideoPlayer];
    _fmVideoPlayer.contrainerViewController = self;
    [_fmVideoPlayer.player play];
    [_fmVideoPlayer showToolView:NO];
    /**
     项目图片隐藏介绍
     */
    //导航栏隐藏
    [self.navigationController setNavigationBarHidden:YES];
    _fmVideoPlayer.playOrPauseBtn.selected = YES;
    _fmVideoPlayer.hidden = NO;
}


#pragma setget method
#pragma mark -懒加载代码
-(FullViewController *)fullVc
{
    if (_fullVc == nil) {
        _fullVc = [[FullViewController alloc] init];
    }
    return _fullVc;
}


-(UIButton*)playButton
{
    if (_playButton == nil) {

        _playButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _playButton.frame = CGRectMake(0, 0, 50, 50);
        _playButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.width*9/32);
        [_playButton addTarget:self action:@selector(playButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _playButton;
}

-(UIImageView *)playImageV
{
    if (_playImageV == nil) {
        _playImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*9/16)];
        if ([self.imageURL isEqualToString:@"1"]) {
            _playImageV.image = [UIImage imageNamed:@"hunyin"];
        }else
        {
            _playImageV.image = [UIImage imageNamed:@"zhubo"];
        }

    }
    return _playImageV;
}
#pragma mark -弹幕代理方法
-(NSTimeInterval)danmakuViewGetPlayTime:(CFDanmakuView *)danmakuView
{
    if (_fmVideoPlayer.progressSlider.value == 1.0) {
        [_fmVideoPlayer.danmakuView stop];
    }
    return _fmVideoPlayer.progressSlider.value*120.0;
}

-(BOOL)danmakuViewIsBuffering:(CFDanmakuView *)danmakuView
{
    return NO;
}


//回调设置导航了
- (void)videoplayViewShowNavigationBar:(BOOL)isShow
{
    if (!self.isFullViewController) {
        [self.navigationController setNavigationBarHidden:isShow];
    }
}

@end
