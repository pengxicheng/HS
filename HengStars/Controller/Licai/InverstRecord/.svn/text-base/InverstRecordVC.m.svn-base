//
//  InverstRecordVC.m
//  HengStars
//
//  Created by hengfu on 16/5/30.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "InverstRecordVC.h"
#import "LicaiRecodeHeaderView.h"
#import "RecoderCell.h"
@interface InverstRecordVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)LicaiRecodeHeaderView *headView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation InverstRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.dataArray  = [NSMutableArray array];
    [self initView];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBar];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)initData
{
    //假数据
    for (int i = 0; i < 20; i ++) {
        [self.dataArray addObject:@"1"];
    }

    __weak UITableView *tempTView = self.tableView;
    __weak typeof(self)  weakself = self;
    [tempTView addHeaderWithCallback:^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"hot": @1,@"limit": @20,@"since": @1456798476,@"type": @"all"};
        [manager GET:@"http://www.owhat.cn/api/feeds.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            //得到数据要刷新table头部
            weakself.headView.title = @"北京旗帜先锋影视";
            weakself.headView.content = @"北京旗帜先锋影视投资有限公司是独立法人企业，是一家制作能力突出的专业化影视公司。公司致力于影视制作与宣传、发行，版权、艺人经纪等多方面领域专注于打造品牌，创造精品进一步整合产业链，达到影视产业化发展的核心模式";
            [weakself.headView  resetSizeAndCreatView];
            weakself.headView.frame =  weakself.headView.calculateFrame;

            

            
            //设置数据
            [weakself.tableView reloadData];

            
            [tempTView headerEndRefreshing];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            //得到数据要刷新table头部和尾部数据

            [tempTView headerEndRefreshing];
        }];
        
    }];
    

    
    [tempTView headerBeginRefreshing];

}

-(void)initView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.headView = [[LicaiRecodeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    self.headView.title = @"北京旗帜先锋影视";
    self.headView.content = @"北京旗帜先锋影视投资有限公司是独立法人企业，是一家制作能力突出的专业化影视公司。公司致力于影视制作与宣传、发行，版权、艺人经纪等多方面领域专注于打造品牌，创造精品进一步整合产业链，达到影视产业化发展的核心模式";
    [self.headView  resetSizeAndCreatView];
    self.headView.frame =  self.headView.calculateFrame;
    self.tableView.tableHeaderView = self.headView;
    //self.headView.delegeta = self;

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
    static NSString *cellIndentifier = @"RecoderCell";
    RecoderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"RecoderCell" bundle:nil] forCellReuseIdentifier:@"RecoderCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    }
    if (self.dataArray) {
  
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}
@end
