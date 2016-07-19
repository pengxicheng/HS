//
//  PHeadView.m
//  HengStars
//
//  Created by hengfu on 16/5/6.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "PHeadView.h"
#import "PHeadCell.h"
#define BTN_TAG 1000
@implementation PHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        currentIndex = 0;
        [self addSubview:self.bgView];
        [self addSubview:self.noticeView];
        [self.noticeView addSubview:self.noticeImage];
        [self.noticeView addSubview:self.nextImage];
        [self.noticeView addSubview:self.tableView];
        [self addSubview:self.leftView];
        [self.leftView addSubview:self.leftImage];
        [self.leftView addSubview:self.leftLable];
        [self.leftView addSubview:self.leftButton];
        [self addSubview:self.rightView];
        [self.rightView addSubview:self.rightImage];
        [self.rightView addSubview:self.rightLable];
        [self.rightView addSubview:self.rightButton];
        [self addSubview:self.hotView];
        [self.hotView addSubview:self.hotImage];
        [self.hotView addSubview:self.hotLabel];
    }
    return self;
}

-(UIView *)bgView
{
    if (!_bgView) {
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
    }
    return _bgView;
}
//
////消息
-(UIView *)noticeView
{
    if (!_noticeView) {
        self.noticeView = [[UIView alloc] initWithFrame:CGRectMake(10, 120, SCREEN_WIDTH -20, 30)];
        self.noticeView.backgroundColor = [UIColor whiteColor];
        self.noticeView.layer.cornerRadius = 4;
        self.noticeView.layer.borderWidth = 1;
        self.noticeView.layer.borderColor = UIColorFromRGB(0xe6e6e6).CGColor;
        
    }
    return _noticeView;
}
//通知标识

-(UIImageView *)noticeImage
{
    if (!_noticeImage) {
        self.noticeImage = [[UIImageView alloc] initWithFrame:CGRectMake(4, 3, 24, 24)];
        self.noticeImage.image = [UIImage imageNamed:@"icon_tongzhi"];
        
    }
    return _noticeImage;

}

-(UIImageView *)nextImage
{
    if (!_nextImage) {
        self.nextImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.noticeView.frame.size.width-27, 3, 24, 24)];
        self.nextImage.image = [UIImage imageNamed:@"icon_gengduo"];
        
    }
    return _nextImage;
    
}


-(UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(32, 0, SCREEN_WIDTH - 84, 30) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        self.dataArray = [NSMutableArray array];
        
        
    }
    return _tableView;
}

- (void)stopTimer
{
    [self.timer invalidate];
}
////两个按钮
//左边按钮
- (UIView *)leftView
{
    if (!_leftView) {
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(10, 160, (SCREEN_WIDTH -30)/2, 60)];
        //圆角处理
        self.leftView.layer.cornerRadius = 4;
        self.leftView.layer.borderColor = UIColorFromRGB(0xe6e6e6).CGColor;
        self.leftView.layer.borderWidth = 0.6f;
        self.leftView.backgroundColor = [UIColor whiteColor];
        
    }
    return _leftView;

}

- (UIImageView *)leftImage
{
    if (!_leftImage) {
        self.leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.leftView.frame.size.width/2 - 17, 2, 34, 34)];
        self.leftImage.image = [UIImage imageNamed:@"icon_shexiangji"];
        
    }
    return _leftImage;
}



-(UILabel *)leftLable
{
    if (!_leftLable) {
        self.leftLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 34, self.leftView.frame.size.width, self.leftView.frame.size.height - 36)];
        
        self.leftLable.text = @"一分钟了解恒星";
        self.leftLable.textAlignment = NSTextAlignmentCenter;
        self.leftLable.font = [UIFont systemFontOfSize:11.f];
    }
    return _leftLable;
}

-(UIButton*)leftButton
{
    if (!_leftButton) {
        self.leftButton = [[UIButton alloc] initWithFrame:self.leftView.bounds];
        self.leftButton.backgroundColor = [UIColor clearColor];
        self.leftButton.tag = BTN_TAG + 1;
        [self.leftButton addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _leftButton;
}

- (UIView *)rightView
{
    if (!_rightView) {
        self.rightView = [[UIView alloc] initWithFrame:CGRectMake(20+(SCREEN_WIDTH -30)/2, 160, (SCREEN_WIDTH -30)/2, 60)];
        //圆角处理
        self.rightView.layer.cornerRadius = 4;
        self.rightView.layer.borderWidth = 1;
        self.rightView.layer.borderColor = UIColorFromRGB(0xe6e6e6).CGColor;
        self.rightView.backgroundColor = [UIColor whiteColor];
        
    }
    return _rightView;
    
}

- (UIImageView *)rightImage
{
    if (!_rightImage) {
        self.rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.rightView.frame.size.width/2 - 17, 2, 34, 34)];
        self.rightImage.image = [UIImage imageNamed:@"icon_touzi"];
        
    }
    return _rightImage;
}



-(UILabel *)rightLable
{
    if (!_rightLable) {
        self.rightLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 34, self.rightView.frame.size.width, self.rightView.frame.size.height - 36)];

        self.rightLable.text = @"一分钟了解众筹";
        self.rightLable.textAlignment = NSTextAlignmentCenter;
        self.rightLable.font = [UIFont systemFontOfSize:11.f];
    }
    return _rightLable;
}

-(UIButton*)rightButton
{
    if (!_rightButton) {
        self.rightButton = [[UIButton alloc] initWithFrame:self.rightView.bounds];
        self.rightButton.backgroundColor = [UIColor clearColor];
        self.rightButton.tag = BTN_TAG + 2;
        [self.rightButton addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _rightButton;
}
//火热项目的view

-(UIView*)hotView
{
    if (!_hotView) {
        self.hotView = [[UIView alloc] initWithFrame:CGRectMake(0, 223, SCREEN_WIDTH, 30)];
        self.hotView.backgroundColor = UIColorFromRGB(0xf2f2f2);

    }
    return _hotView;
}

-(UIImageView *)hotImage
{
    if (!_hotImage) {
        self.hotImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3, 24, 24)];
        self.hotImage.image = [UIImage imageNamed:@"icon_biaotifuhao"];

    }
    return _hotImage;

}

-(UILabel *)hotLabel
{
    if (!_hotLabel) {
        self.hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(36, 0, SCREEN_WIDTH -46, 30)];
        self.hotLabel.text = @"火热项目";
        self.hotLabel.textColor = UIColorFromRGB(0x333333);
        self.hotLabel.font = [UIFont systemFontOfSize:13.f];
        
    }
    return _hotLabel;
}

#pragma mark datesource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray && [self.dataArray count]) {
        return [self.dataArray count];
    }
    return  0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"PHeadCell";//定义一个可重用标识
    PHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"PHeadCell" bundle:nil] forCellReuseIdentifier:@"PHeadCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"PHeadCell"];
        
    }
    if (self.dataArray) {

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLable.text = [self.dataArray objectAtIndex:indexPath.row];
        cell.titleLable.font = [UIFont systemFontOfSize:11.f];
    }
    //设置cell相关的信息
    return cell;
}

#pragma mark tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.noticeView.frame.size.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.dataArray){
        NSLog(@"通知选中%ld",(long)indexPath.row) ;
        [self.delegeta didSelectType:DidSelecNotic withData:[self.dataArray objectAtIndex:indexPath.row]];
    }
}


#pragma mark banner视图回调
- (void)initBannerView:(NSMutableArray*)bArray
{
    NSUInteger length = [bArray count];
    NSMutableArray* itemArray = [NSMutableArray arrayWithCapacity:length + 2];
    if (length > 0) {
        NSDictionary* dict = [bArray objectAtIndex:length - 1];
        BanerItem* item = [[BanerItem alloc] initWithDict:dict tag:-1];
        [itemArray addObject:item];
    }
    if (length == 1) {
        //[self.mbView sd_setImageWithURL:[[self.data objectAtIndex:0] objectForKey:@"src"] placeholderImage:[UIImage imageNamed:@"Banner_placehold"]];
    }
    for (int i = 0; i < length; i++) {
        NSDictionary* dict = [bArray objectAtIndex:i];
        BanerItem* item = [[BanerItem alloc] initWithDict:dict tag:i];
        [itemArray addObject:item];
    }
    //添加第一张图 用于循环
    if (length > 0) {
        NSDictionary* dict = [bArray objectAtIndex:0];
        BanerItem* item = [[BanerItem alloc] initWithDict:dict tag:length];
        [itemArray addObject:item];
    }
    if (!self.bannerView) {
        self.bannerView = [[BannerView alloc] initWithFrame:self.bgView.bounds delegate:self imageItems:itemArray isAuto:YES];
        [self.bgView addSubview:self.bannerView];
        
    }else{
        self.bannerView.arry = itemArray;
        [self.bannerView resetData];
    }
    //self.defaultImage.hidden = YES;
    [self.bannerView scrollToIndex:1];
}

#pragma Banner回调
- (void)foucusImageFrame:(BannerView*)imageFrame didSelectItem:(BanerItem*)item
{
     NSLog(@"didSelectItem");
     [self.delegeta didSelectType:DidSelecBanner withData:item];
}

- (void)foucusImageFrame:(BannerView*)imageFrame currentItem:(int)index{

    if ([self.bannerData count] > index) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
        });
    }
    
}

#pragma mark 通知
-(void)setNoticeData:(NSMutableArray *)noticeData
{
//    [self.dataArray removeAllObjects];
//    [self.dataArray addObjectsFromArray:noticeData];
    [self.dataArray addObject:@"证监会决定2016年开展股权众筹融资试点"];
    [self.dataArray addObject:@"恒星计划决定2018上市，成为影视众筹界第一个上市的公司"];
    [self.tableView reloadData];
    [self stopTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(newsScroll) userInfo:nil repeats:YES];
}
//到时还要做滚动处理
- (void)newsScroll
{
    if (self.dataArray && [self.dataArray count]) {
        NSIndexPath* indexP = [NSIndexPath indexPathForRow:currentIndex inSection:0];
        if (indexP) {
            [self.tableView scrollToRowAtIndexPath:indexP atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            if (currentIndex < [self.dataArray count] - 1) {
                currentIndex++;
            }
            else {
                currentIndex = 0;
            }
        }
    }
}


-(void)leftBtnClick:(UIButton *) btn
{
    NSLog(@"leftBtnClick");
    [self.delegeta didSelectType:DidSelecBtn withData:[NSString stringWithFormat:@"%ld",(long)btn.tag - BTN_TAG]];

}
-(void)rightBtnClick:(UIButton *) btn
{
    NSLog(@"rightBtnClick");
    [self.delegeta didSelectType:DidSelecBtn withData:[NSString stringWithFormat:@"%ld",(long)btn.tag - BTN_TAG]];
    
}
@end
