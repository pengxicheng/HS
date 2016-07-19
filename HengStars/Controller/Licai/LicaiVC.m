//
//  LicaiVC.m
//  HengStars
//
//  Created by hengfu on 16/3/4.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "LicaiVC.h"
#import "LicaiCell.h"
#import "UIImageView+WebCache.h"
#import "LicaiDetailVC.h"
#import "ProjectCell.h"
#import "UIColor+CreateImage.h"
#define CellH 0.59375
@interface LicaiVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray  *dataArray;
@end

@implementation LicaiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavigationBar];
    [self initData];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBar];
    [self.navigationController setNavigationBarHidden:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initData
{
    self.dataArray = [NSMutableArray array];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3050/f36e24875b193920795eb5bdf4f72021d2e9c42d?e=1457323058&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:0hpZBDB5OUNXQikmI5vKq63EDwY="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3117/3c51840a4cfb0b0879680bc51b2424487ed3be0c?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4FOjRZMmEh7yd9ovcY2L2outidc="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3114/884f05a11decad163a0fe5a65f7dc534746a482a?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:Lr0gEju29sqyryyUTWu428WT7sk="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3121/56a9c260f66623b8444427229e05b3fed0ab174b?e=1457323060&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:Rrwk4QaWCuh-a5kS2dFbyXoEzdE="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3125/3697aff2a0e8fcd7dac4de7e1a4e965aae311542?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:s8FieJboi3Baa12zwbyByEmqBxc="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3126/fef1976fb0a0479eb115f0f850805be68ffd8899?e=1457323060&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:STwYDZ4sxJoKrh8HsKQjuXdCELU="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3131/6c21720983e4a5a42e5af871893aedaef8d885fd?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4QKpAgTZsInH6N9EVTUP7WV1TdQ="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3144/e4f181eff737f731e366b694356922c8c809f2f5?e=1457407537&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:7a_gll8CSRe2_yoB5jRq3EFXFGE="];
//    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3105/77fc6c260f63b27ee3f70447ef23ab4d5645e202?e=1457407538&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4h9FD0kebRFPPYreO2P3Fnerm6I="];
    for (int i = 0; i < 10; i ++) {
        if (!(i%2)) {
            [self.dataArray addObject:@"1"];
        }else
        {
            [self.dataArray addObject:@"2"];
        }
    }
    __weak UITableView *tempTView = self.tableView;
    NSDictionary *parameters = @{@"hot": @1,@"limit": @20,@"since": @1456798476,@"type": @"all"};
    [tempTView addHeaderWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        //manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager GET:@"http://www.owhat.cn/api/feeds.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            [tempTView headerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            [tempTView headerEndRefreshing];
        }];

    }];
    
    [tempTView addFooterWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        //manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager GET:@"http://www.owhat.cn/api/feeds.json?hot=1&limit=20&page=1&since=1456798476&type=all" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            [tempTView footerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            [tempTView footerEndRefreshing];
        }];
        
    }];
    

}

-(void)initView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark datesource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray) {
        return [self.dataArray count];
    }
    return  0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIndentifier = @"ProjectCell";//定义一个可重用标识
    ProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ProjectCell" bundle:nil] forCellReuseIdentifier:@"ProjectCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectCell"];
        
    }
    if (self.dataArray) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setTestInfor:[self.dataArray objectAtIndex:indexPath.row]];
    }
    //设置cell相关的信息
    return cell;
}

#pragma mark tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellH * SCREEN_WIDTH;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.dataArray){
        [self performSegueWithIdentifier:@"licaid" sender:[self.dataArray objectAtIndex:indexPath.row]];
    }
}

#pragma mark overloaded method
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(NSString*)sender
{
    UIViewController* zVC = segue.destinationViewController;
    zVC.hidesBottomBarWhenPushed = YES;
    if ([segue.identifier isEqualToString:@"licaid"]) {
        LicaiDetailVC* lVC = segue.destinationViewController;
        //lVC.hidesBottomBarWhenPushed = YES;
        lVC.imageURL = sender;
    }

}

@end
