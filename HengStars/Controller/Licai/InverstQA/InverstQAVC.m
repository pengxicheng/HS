//
//  InverstQAVC.m
//  HengStars
//
//  Created by hengfu on 16/5/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "InverstQAVC.h"
#import "UIColor+CreateImage.h"
#import "QACell.h"
#import "Question.h"
#define SV_TAG 1000
#define TB_TAG 50000
//按钮id
#define BUTTONID (sender.tag-SV_TAG)
//滑动id
#define BUTTONSELECTEDID (scrollViewSelectedChannelID - SV_TAG)


@interface InverstQAVC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    //top
    NSInteger userSelectedChannelID;        //点击按钮选择名字ID
    NSInteger scrollViewSelectedChannelID;  //滑动列表选择名字ID
    UIImageView *shadowImageView;           //选中阴影
    
    //down
    CGFloat userContentOffsetX;
    BOOL isLeftScroll;
    NSInteger _index;

}
//top
@property (nonatomic, retain) NSArray *nameArray;
@property(nonatomic,strong)NSMutableArray *buttonOriginXArray;
@property(nonatomic,strong)NSMutableArray *buttonWithArray;
@property (weak, nonatomic) IBOutlet UIScrollView *topScView;
@property (weak, nonatomic) IBOutlet UIScrollView *downScView;

//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tzArray;
@property(nonatomic,strong) NSMutableArray *ptArray;
//down
@property (nonatomic, strong) NSString *type;
@end

@implementation InverstQAVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    

    
    self.tzArray = [NSMutableArray array];
    self.ptArray = [NSMutableArray array];
    [self initView];
    [self initData];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBar];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark response buttonEvent
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initData
{
    for (int i = 0; i < 10; i ++) {
        if (i%2) {
           NSDictionary *dic = @{@"questionString":@"网络大电影项目《Sorry，我还没死》现处于什么阶段？",@"answerString":@"影片现正在筹备拍摄中，制片方将在收到投资款项后75天内完成全部制作,且承诺影片将于2016年9月1日前上映"};
            Question *question = [Question questoineWithDic:dic];
            [self.tzArray addObject:question];
        }else
        {
            NSDictionary *dic = @{@"questionString":@"参投者如何参与和监督项目募集成功后的发展",@"answerString":@"在项目发起前，恒星计划会要求项目发起人提供真实有效的联系信息。项目成功后，平台会继续服务投资者，及时公示项目相关信息，披露项目动态，组织“探班”和线下交流活动，让投资人实时了解到项目的进行情况。并于项目最后一笔回报结束后为投资人提供项目详细财务报表，项目后期持续通过QQ群、400电话等途径与投资人建立良好的沟通机制。"};
            Question *question = [Question questoineWithDic:dic];
            [self.tzArray addObject:question];
        }
        
        if (i%2) {
            NSDictionary *dic = @{@"questionString":@"网络大电影项目《Sorry，我还没死》现处于什么阶段？",@"answerString":@"影片现正在筹备拍摄中，制片方将在收到投资款项后75天内完成全部制作,且承诺影片将于2016年9月1日前上映"};
            Question *question = [Question questoineWithDic:dic];
            [self.ptArray addObject:question];
        }else
        {
            NSDictionary *dic = @{@"questionString":@"项目如何收回投资者的本金",@"answerString":@"项目将于上映后第3个月第一次分配发行收益时，完全偿付投资本金，不足部分由制片方深圳华娱美视文化传媒有限公司垫资偿付"};
            Question *question = [Question questoineWithDic:dic];
            [self.ptArray addObject:question];
        }
    }
}

- (void)initView
{
    [self initTopSC];
    [self initDownView];

}

//top
-(void)initTopSC
{
    self.topScView.backgroundColor = [UIColor whiteColor];
    self.topScView.pagingEnabled = NO;
    self.topScView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.topScView.showsHorizontalScrollIndicator = NO;
    self.topScView.showsVerticalScrollIndicator = NO;
    userSelectedChannelID = SV_TAG;
    scrollViewSelectedChannelID = SV_TAG;
    
    self.buttonOriginXArray = [NSMutableArray array];
    self.buttonWithArray = [NSMutableArray array];
    self.nameArray = @[@"项目投资问答",@"平台投资问答"];
    [self initWithNameButtons];
    
}

-(void)initWithNameButtons
{
    float xPos = 0;
    for (int i = 0; i < [self.nameArray count]; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *title = [self.nameArray objectAtIndex:i];
        
        [button setTag:i+SV_TAG];
        if (i == 0) {
            button.selected = YES;
        }
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[button setTitleColor:RGBAlpha(57, 163, 232, 1) forState:UIControlStateSelected];
        [button setTitleColor:UIColorFromRGB(0xffd949) forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectNameButton:) forControlEvents:UIControlEventTouchUpInside];
        
        int buttonWidth = SCREEN_WIDTH/[self.nameArray count];
        
        button.frame = CGRectMake(xPos, 9, buttonWidth, 30);
        
        [_buttonOriginXArray addObject:@(xPos)];
        
        xPos += buttonWidth;
        
        [_buttonWithArray addObject:@(button.frame.size.width)];
        
        [self.topScView addSubview:button];
    }
    UIImageView *imageLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.topScView.frame.size.height -1, SCREEN_WIDTH, 1)];
    imageLine.image = [UIColorFromRGB(0xe6e6e6) imageWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    [self.topScView addSubview:imageLine];
    shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, self.topScView.frame.size.height -4, [[_buttonWithArray objectAtIndex:0] floatValue]-4, 3)];
    //[shadowImageView setImage:[UIImage imageNamed:@"bg_xuanzhong"]];
    [shadowImageView setImage:[UIColorFromRGB(0xffd749) imageWithFrame:CGRectMake(0, 0, [[_buttonWithArray objectAtIndex:0] floatValue]-4, 3)]];
        self.topScView.contentSize = CGSizeMake(SCREEN_WIDTH, 44);
    [self.topScView addSubview:shadowImageView];
}


//点击顶部条滚动标签
- (void)selectNameButton:(UIButton *)sender
{
    [self adjustScrollViewContentX:sender];
    
    //如果更换按钮
    if (sender.tag != userSelectedChannelID) {
        //取之前的按钮
        UIButton *lastButton = (UIButton *)[self.topScView viewWithTag:userSelectedChannelID];
        lastButton.selected = NO;
        //赋值按钮ID
        userSelectedChannelID = sender.tag;
    }
    
    //按钮选中状态
    if (!sender.selected) {
        sender.selected = YES;
        
        [UIView animateWithDuration:0.25 animations:^{
            
            [shadowImageView setFrame:CGRectMake(sender.frame.origin.x+2, 41, [[_buttonWithArray objectAtIndex:BUTTONID] floatValue]-4, 3)];
            
        } completion:^(BOOL finished) {
            if (finished) {
                //设置新闻页出现
                [self.downScView setContentOffset:CGPointMake(BUTTONID*SCREEN_WIDTH, 0) animated:YES];
                //赋值滑动列表选择频道ID
                scrollViewSelectedChannelID = sender.tag;
            }
        }];
        
    }
    //重复点击选中按钮
    else {
        
    }
}

- (void)adjustScrollViewContentX:(UIButton *)sender
{
    float originX = [[_buttonOriginXArray objectAtIndex:BUTTONID] floatValue];
    float width = [[_buttonWithArray objectAtIndex:BUTTONID] floatValue];
    
    if (sender.frame.origin.x - self.topScView.contentOffset.x > SCREEN_WIDTH-(0+width)) {
        [self.topScView setContentOffset:CGPointMake(originX - 30, 0)  animated:YES];
    }
    
    if (sender.frame.origin.x - self.topScView.contentOffset.x < 5) {
        [self.topScView setContentOffset:CGPointMake(originX,0)  animated:YES];
    }
}

//滚动内容页顶部滚动
- (void)setButtonUnSelect
{
    //滑动撤销选中按钮
    UIButton *lastButton = (UIButton *)[self.topScView viewWithTag:scrollViewSelectedChannelID];
    lastButton.selected = NO;
}

- (void)setButtonSelect
{
    //滑动选中按钮
    UIButton *button = (UIButton *)[self.topScView viewWithTag:scrollViewSelectedChannelID];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [shadowImageView setFrame:CGRectMake(button.frame.origin.x+2, 41, [[_buttonWithArray objectAtIndex:button.tag-1000] floatValue]-4, 3)];
        
    } completion:^(BOOL finished) {
        if (finished) {
            if (!button.selected) {
                button.selected = YES;
                userSelectedChannelID = button.tag;
            }
        }
    }];
    
}

-(void)setScrollViewContentOffset
{
    float originX = [[_buttonOriginXArray objectAtIndex:BUTTONSELECTEDID] floatValue];
    float width = [[_buttonWithArray objectAtIndex:BUTTONSELECTEDID] floatValue];
    
    if (originX - self.topScView.contentOffset.x > SCREEN_WIDTH-(0+width)) {
        [self.topScView setContentOffset:CGPointMake(originX - 30, 0)  animated:YES];
    }
    
    if (originX - self.topScView.contentOffset.x < 5) {
        [self.topScView setContentOffset:CGPointMake(originX,0)  animated:YES];
    }
}

//down
- (void)initDownView
{
    self.downScView.delegate = self;
    //self.downScroll.backgroundColor = [UIColor lightGrayColor];
    self.downScView.pagingEnabled = YES;
    self.downScView.userInteractionEnabled = YES;
    self.downScView.bounces = NO;
    self.type =@"";
    self.downScView.showsHorizontalScrollIndicator = NO;
    self.downScView.showsVerticalScrollIndicator = NO;
    userContentOffsetX = 0;
    [self initWithViews];
    
}

- (void)initWithViews
{

    _index    = 0;
    for (int i = 0; i < [self.nameArray count]; i++) {
        UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0+SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT-108)];
        sc.contentSize = CGSizeMake(SCREEN_WIDTH, sc.frame.size.height);//设置滚动区域
        sc.pagingEnabled = YES;//设置是否自动滚动到边界
        sc.scrollEnabled = YES;//设置是否支持滚动
        sc.backgroundColor = RGBAlpha(244, 244, 244, 1);
        sc.directionalLockEnabled = YES;//设置方向锁定(即:同一时间只允许向一个方向滚动)
        sc.bounces = YES;//设置边界是否反弹
        //加载3个tableView;
        UITableView *tzTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, sc.bounds.size.width, sc.bounds.size.height)style:UITableViewStylePlain];
        tzTabelView.estimatedRowHeight = 90.f;
        tzTabelView.rowHeight = UITableViewAutomaticDimension;
        tzTabelView.dataSource = self;//设置数据源委托
        tzTabelView.delegate = self;//设置代理委托
        tzTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;//设置分隔线样式
        tzTabelView.tag = SV_TAG+i;
        tzTabelView.bounces = YES;//设置边界反弹
        [sc addSubview:tzTabelView];
        
        [self.downScView addSubview:sc];
        
    }
    
    
    self.downScView.contentSize = CGSizeMake(SCREEN_WIDTH*[self.nameArray count], SCREEN_HEIGHT-108);
    
    [self addMJView];
}

/**
 @功能：添加上下拉刷新View;
 @参数：
 @返回值：
 */
- (void)addMJView
{
    for (int i = 0; i<[self.nameArray count]; i++) {
        __weak UITableView *tempTabelView = (UITableView*)[self.downScView viewWithTag:SV_TAG + i];
        [tempTabelView addHeaderWithCallback:^{
            [tempTabelView headerEndRefreshing];
        }];
    }
        
    UITableView *tableview = (UITableView*)[self.downScView viewWithTag:SV_TAG];
    [tableview headerBeginRefreshing];
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    userContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (userContentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调整顶部滑条按钮状态
    [self adjustTopScrollViewButton:scrollView];
    
    [self loadData];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self loadData];
}
/**
 @功能：加载数据和刷新数据
 @参数：
 @返回值：
 */
-(void)loadData
{
    CGFloat pagewidth = self.downScView.frame.size.width;
    NSInteger page = floor((self.downScView.contentOffset.x - pagewidth/self.nameArray.count)/pagewidth)+1;
    
    //0:项目投资问答，1：平台投资问答
    //先做判断避免重复刷新
    if (_index == page) {
        return;
    }else{
        UITableView *tableView = (UITableView *)[self.downScView viewWithTag:page+SV_TAG];
        switch (page) {
            case 0:
            {
                if ([self.tzArray count]< 1) {
                    [tableView headerBeginRefreshing];
                }
                
            }
                break;
            case 1:
            {
                if ([self.ptArray count]< 1) {
                    [tableView headerBeginRefreshing];
                }
                
            }
                break;
            default:
                break;
        }
        
        _index = page;
    }
    
    
}
//滚动后修改顶部滚动条
- (void)adjustTopScrollViewButton:(UIScrollView *)scrollView
{
    CGFloat pagewidth = self.downScView.frame.size.width;
    int page = floor((self.downScView.contentOffset.x - pagewidth/self.nameArray.count)/pagewidth)+1;
    if (scrollViewSelectedChannelID != page + SV_TAG) {
        [self setButtonUnSelect];
        scrollViewSelectedChannelID = page + SV_TAG;
        [self setButtonSelect];
        [self setScrollViewContentOffset];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger i = tableView.tag-SV_TAG;
    
    
    QACell * cell = [tableView dequeueReusableCellWithIdentifier:@"QACell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"QACell" bundle:nil] forCellReuseIdentifier:@"QACell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"QACell"];
    }
    
    
    switch (i) {
        case 0:
        {
            if (self.tzArray && [self.tzArray count]>0)
            {
                cell.question = self.tzArray[indexPath.row];
            }
        }
            break;
        case 1:
        {
            if (self.ptArray && [self.ptArray count]>0)
            {
                cell.question = self.ptArray[indexPath.row];
            }
        }
            break;
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}

#pragma table num
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger i = tableView.tag-SV_TAG;
    
    switch (i) {
        case 0:
        {
            if (self.tzArray && [self.tzArray count])
            {
                //添加上拉刷新控件
                return [self.tzArray count];
            }
            return 0;
        }
            break;
        case 1:
        {
            if (self.ptArray && [self.ptArray count])
            {
                //添加上拉刷新控件
                return [self.ptArray count];
            }
            return 0;
        }
            break;
        default:
            return 0;
            break;
    }
    
    return 0;
}

#pragma 当选择了其中一个cell时,进入详情控制器
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma table high
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger i = tableView.tag-SV_TAG;
    switch (i) {
        case 0:
        {
            if (self.tzArray && [self.tzArray count])
            {
                Question *question = self.tzArray[indexPath.row];
                return question.cellHeight;
            }
            return 0;
        }
            break;
        case 1:
        {
            if (self.ptArray && [self.ptArray count])
            {
                Question *question = self.ptArray[indexPath.row];
                return question.cellHeight;
            }
            return 0;
        }
            break;
        default:
            return 0;
            break;
    }
    
    return 0;

    
}

@end
