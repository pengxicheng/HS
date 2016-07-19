//
//  PmainVC.m
//  HengStars
//
//  Created by Peng xi cheng on 16/5/7.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "PmainVC.h"
#import "ProjectCell.h"
#import "PHeadView.h"
#import "PfootView.h"
#import "ADManager.h"
#import "UITabBarController+Start.h"
#import "UIColor+CreateImage.h"
#import "LicaiDetailVC.h"
#import "UMSocial.h"
#import "UMSocialConfig.h"
#import "WebVC.h"
#define CellH 0.59375
@interface PmainVC ()<UITableViewDataSource,UITableViewDelegate,PfootViewDelegate,PHeadViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)PHeadView *headView;
@property(strong,nonatomic)PfootView *footView;
@property(strong,nonatomic) NSMutableArray *dataArray;
@property(strong,nonatomic)NSMutableArray *bannerData;
//测试数据
@property(strong,nonatomic)NSString *url;
@end

@implementation PmainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //测试数据
    self.url = @"http://www.stars999.com/index.html";
    [self.tabBarController setADView];
    //手势密码  测试svn提交
    
    //设置导航栏
    [self setNavigationBar];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.dataArray = [NSMutableArray array];
    self.bannerData = [NSMutableArray array];
    [self initView];
    [self initData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [self setNavigationBar];
}
-(void)initData
{
    //假数据
    [self.dataArray addObject:@"1"];
    [self.dataArray addObject:@"2"];
    __weak UITableView *tempTView = self.tableView;
    [tempTView addHeaderWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"hot": @1,@"limit": @20,@"since": @1456798476,@"type": @"all"};
        [manager GET:@"http://www.owhat.cn/api/feeds.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            //得到数据要刷新table头部和尾部数据
             [self getAppBanner];
            
            NSMutableArray *nArray = [NSMutableArray array];
            [nArray addObject:@"111"];
            [nArray addObject:@"222"];
            [self.headView setNoticeData:nArray];
            
            //设置数据
            [self.footView setFootDataWithArray:nArray];
            
            [tempTView headerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            //得到数据要刷新table头部和尾部数据
            [self getAppBanner];
            
            NSMutableArray *nArray = [NSMutableArray array];
            [nArray addObject:@"111"];
            [nArray addObject:@"222"];
            [self.headView setNoticeData:nArray];
            
            //设置数据
            [self.footView setFootDataWithArray:nArray];
            
            [tempTView headerEndRefreshing];
            [tempTView headerEndRefreshing];
        }];
        
    }];
    
//    [tempTView addFooterWithCallback:^{
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        NSDictionary *parameters = @{@"hot": @1,@"limit": @20,@"since": @1456798476,@"type": @"all"};
//        //manager.requestSerializer = [AFJSONRequestSerializer serializer];
//        [manager GET:@"http://www.owhat.cn/api/feeds.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"responseObject:%@",responseObject);
//            //得到数据要刷新table头部和尾部数据
//            [tempTView footerEndRefreshing];
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"error:%@",error);
//            [tempTView footerEndRefreshing];
//        }];
//    }];
    
    [tempTView headerBeginRefreshing];

}

//获取banner数据
-(void)getAppBanner
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSDictionary* parameters = @{ @"deviceType" : @"ios" };
    [manager POST:KGetappbanner
       parameters:parameters
          success:^(AFHTTPRequestOperation* operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
              if ([responseObject[@"status"] isEqualToString:@"0"]) {
                  NSDictionary* dict = responseObject;
                  if ([self.bannerData count]>0) {
                      [self.bannerData removeAllObjects];
                  }
                  [self.bannerData addObjectsFromArray:dict[@"result"]];
                  //主线程执行
                  dispatch_async(dispatch_get_main_queue(), ^{
                      //[self initBannerView:self.bannerData];
                      [self.headView initBannerView:self.bannerData];
                      
                  });
              }
              
          }
          failure:^(AFHTTPRequestOperation* operation, NSError* error) {
              NSLog(@"Error: %@", error);

          }];
}

-(void)initView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.headView = [[PHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 253)];
    self.tableView.tableHeaderView = self.headView;
    self.headView.delegeta = self;
  
   
    self.footView = [[PfootView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 372)];
    self.tableView.tableFooterView = self.footView;
    self.footView.delegate = self;

}


#pragma mark datesource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray) {
        return [self.dataArray count];
    }
    return  0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"ProjectCell";
    ProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ProjectCell" bundle:nil] forCellReuseIdentifier:@"ProjectCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    }
    if (self.dataArray) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setTestInfor:[self.dataArray objectAtIndex:indexPath.row]];
        cell.detailBtn.tag = indexPath.row;
        [cell.detailBtn addTarget:self action:@selector(detailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellH * SCREEN_WIDTH;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.dataArray){
        //[self performSegueWithIdentifier:@"licaia" sender:[self.dataArray objectAtIndex:indexPath.row]];
        [self performSegueWithIdentifier:@"licaia" sender:[self.dataArray objectAtIndex:indexPath.row]];
    }
}

-(void)detailBtnClick:(UIButton *)btn
{
    if(self.dataArray){
        [self performSegueWithIdentifier:@"licaia" sender:[self.dataArray objectAtIndex:btn.tag]];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark PfootDelegate
- (void)footViewDidSelect:(PfootViewDidSelect)type withData:(id)data
{
    switch (type) {
        case PfootViewDidSelectView:
        {
            NSLog(@"PfootViewDidSelectView");
            [self performSegueWithIdentifier:@"StoryDetail" sender:nil];
        }
            break;
        case PfootViewDidSelectBtn:
        {
            NSLog(@"PfootViewDidSelectBtn");
            [self shareWithUrl];
        }
            break;
        default:
            break;
    }

}
#pragma mark PHeadViewDelegate
- (void)didSelectType:(DidSelectype)type withData:(id)data
{
    switch (type) {
        case DidSelecBanner:
        {
            //data:banner 实体数据
            NSLog(@"实体数据");
            [self performSegueWithIdentifier:@"BannerNotice" sender:@"活动详情"];
        }
            break;
        case DidSelecNotic:
        {
            //data: 通知实体数据
            NSLog(@"通知实体数据");
            [self performSegueWithIdentifier:@"BannerNotice" sender:@"热门新闻"];
            
        }
            break;
            case DidSelecBtn:
        {
            //data: 对应按钮tag
            NSLog(@"对应按钮tag:%@",(NSString *)data);
            [self performSegueWithIdentifier:@"BannerNotice" sender:@"一分钟了解恒星计划"];
        
        }
            break;
        default:
            break;
    }

}

#pragma mark overloaded method
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(NSString*)sender
{
    UIViewController* zVC = segue.destinationViewController;
    zVC.hidesBottomBarWhenPushed = YES;
    if ([segue.identifier isEqualToString:@"BannerNotice"]) {
        WebVC* wVC = segue.destinationViewController;
        wVC.titleText = sender;
    }else if ([segue.identifier isEqualToString:@"licaia"]) {
        LicaiDetailVC* lVC = segue.destinationViewController;
        lVC.imageURL = sender;
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
