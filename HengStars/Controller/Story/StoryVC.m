//
//  StoryVC.m
//  HengStars
//
//  Created by hengfu on 16/5/6.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "StoryVC.h"
#import "StoryCell.h"
#import "UIColor+CreateImage.h"
#import "UMSocial.h"
#import "UMSocialConfig.h"
//这个要动态
#define StoryCellH 0.534375
@interface StoryVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *sTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
//测试连接
@property(nonatomic,strong)NSString *url;
@end

@implementation StoryVC

- (void)viewDidLoad {
    self.url = @"www.baidu.com";
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataArray = [NSMutableArray array];
    [self initView];
    [self initData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initData
{
    for (int i = 0; i < 10; i ++) {
        if (i%2) {
            [self.dataArray addObject:@"1"];
        }else
        {
            [self.dataArray addObject:@"2"];
        }
    }
    __weak UITableView *tempTView = self.sTableView;
    [tempTView addHeaderWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"hot": @1,@"limit": @20,@"since": @1456798476,@"type": @"all"};
        [manager GET:@"http://www.owhat.cn/api/feeds.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            //得到数据要刷新table头部和尾部数据
             [tempTView headerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            [tempTView headerEndRefreshing];
        }];

        
    }];
    [tempTView addFooterWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"hot": @1,@"limit": @20,@"since": @1456798476,@"type": @"all"};
        [manager GET:@"http://www.owhat.cn/api/feeds.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            //得到数据要刷新table头部和尾部数据
            [tempTView headerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            [tempTView headerEndRefreshing];
        }];
        
    }];
    
    [tempTView headerBeginRefreshing];
}

- (void)initView
{
    self.sTableView.delegate = self;
    self.sTableView.dataSource = self;
    self.sTableView.separatorStyle = UITableViewCellSelectionStyleNone;

}

#pragma mark datesource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray) {
        return [self.dataArray count];
    }
    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"StoryCell";
    StoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"StoryCell" bundle:nil] forCellReuseIdentifier:@"StoryCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell"];
    }
    if (self.dataArray && [self.dataArray count] > 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell setTestInfor:[self.dataArray objectAtIndex:indexPath.row]];
    }
    return  cell;
}

-(void)shareBtnClick:(UIButton*)btn
{
    [self shareWithUrl];
}
#pragma mark tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return SCREEN_WIDTH * StoryCellH;
    return 171;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.dataArray){
        [self performSegueWithIdentifier:@"ToStory" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender
{
    UIViewController *vc = segue.destinationViewController;
    vc.hidesBottomBarWhenPushed = YES;
    if ([segue.identifier isEqualToString:@"ToStory"]) {
        
    }

}


//分享
- (void)shareWithUrl
{
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

@end
