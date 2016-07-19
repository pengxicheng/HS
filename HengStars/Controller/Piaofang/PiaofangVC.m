//
//  PiaofangVC.m
//  HengStars
//
//  Created by hengfu on 16/3/8.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "PiaofangVC.h"
#import "FareCell.h"
#import "HeadView.h"
@interface PiaofangVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *pTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation PiaofangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.dataArray = [NSMutableArray array];
    [self initView];
    [self initData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.dataArray = [NSMutableArray array];

    __weak UITableView *tempTView = self.pTableView;
    //http://v.juhe.cn/boxoffice/wp  get 电影票房查询
    NSDictionary *parameters = @{@"dtype": @"json",@"key": @"bfd35ce34b37786c9a76f8e45fafb0b8"};
    [tempTView addHeaderWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://v.juhe.cn/boxoffice/wp" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            if ([[responseObject objectForKey:@"resultcode"] isEqualToString:@"200"]&&[responseObject objectForKey:@"result"]) {
                NSArray *array = [responseObject objectForKey:@"result"];
                NSMutableArray *a = [NSMutableArray array];
                if ([array count] > 0) {
                    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        NSDictionary *modelDic = [[NSDictionary alloc] initWithObjectsAndKeys:[obj objectForKey:@"name"],@"name",[obj objectForKey:@"totals"],@"totals",[obj objectForKey:@"statistics"],@"statistics",[obj objectForKey:@"averaging"],@"averaging",[obj objectForKey:@"attendance"],@"attendance",[obj objectForKey:@"fare"],@"fare", [obj objectForKey:@"boxoffice"],@"boxoffice", [obj objectForKey:@"people"],@"people", nil];
                        [a addObject:modelDic];
                    }];
                    
                    [self.dataArray addObjectsFromArray:a];
                }

                [tempTView reloadData];
            }
            
            [tempTView headerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            [tempTView headerEndRefreshing];
        }];
        
    }];
    [tempTView headerBeginRefreshing];
}

-(void)initView
{
    self.pTableView.delegate = self;
    self.pTableView.dataSource = self;
    self.pTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    //HeadView
    HeadView *headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headView.fName.text = @"片名";
    headView.fTotle.text = @"统计数";
    headView.fRate.text = @"票房比例";
    headView.fare.text = @"累计票房";
    self.pTableView.tableHeaderView = headView;
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
    
    static NSString *cellIndentifier = @"FareCell";//定义一个可重用标识
    FareCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"FareCell" bundle:nil] forCellReuseIdentifier:@"FareCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"FareCell"];
        
    }
    if (self.dataArray && [self.dataArray count] > 0) {
        //cell.titleView.image = [UIImage imageNamed:@"123.jpg"];
        [cell setInforWithDic:[self.dataArray objectAtIndex:indexPath.row] indexColor:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //设置cell相关的信息
    return cell;
    
}

#pragma mark tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
