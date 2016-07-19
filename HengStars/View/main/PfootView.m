//
//  PfootView.m
//  HengStars
//
//  Created by Peng xi cheng on 16/5/8.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "PfootView.h"
#import "StoryCell.h"
#define Btn_Tag 1000
@implementation PfootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        [self addSubview:self.hotView];
        [self.hotView addSubview:self.imageView];
        [self.hotView addSubview:self.titleLable];
        [self addSubview:self.tableView];
    }
    return self;
}

-(UIView*)hotView
{
    if (!_hotView) {
        self.hotView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 30)];
        self.hotView.backgroundColor = UIColorFromRGB(0xf2f2f2);
    }
    return _hotView;
}

-(UIImageView*)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3, 24, 24)];
        self.imageView.image = [UIImage imageNamed:@"icon_biaotifuhao"];
    }
    return _imageView;
}

-(UILabel *)titleLable
{
    if (!_titleLable) {
        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(26, 0, self.hotView.frame.size.width-28, 30)];
        self.titleLable.text = @"恒星故事";
        self.titleLable.font = [UIFont systemFontOfSize:13.f];
        
    }
    return _titleLable;

}

-(UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 171*2) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        self.dataArray = [NSMutableArray array];
        //假数据
        for (int i = 0; i < 2; i ++) {
            if (i%2) {
                [self.dataArray addObject:@"1"];
            }else
            {
                [self.dataArray addObject:@"2"];
            }
        }
        
    }
    return _tableView;
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
    static NSString *cellIndentifier = @"StoryCell";//定义一个可重用标识
    StoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"StoryCell" bundle:nil] forCellReuseIdentifier:@"StoryCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell"];
        
    }
    if (self.dataArray) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setTestInfor:[self.dataArray objectAtIndex:indexPath.row]];
        cell.shareBtn.tag = indexPath.row + Btn_Tag;
        [cell.shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    //设置cell相关的信息
    return cell;
}

#pragma mark tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 171;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.dataArray){
        NSLog(@"故事选中%ld",(long)indexPath.row) ;
        [self.delegate footViewDidSelect:PfootViewDidSelectView withData:[self.dataArray objectAtIndex:indexPath.row]];
    }
}
-(void)setFootDataWithArray:(NSMutableArray *)data
{
    NSLog(@"设置foot数据");

}

//分享
-(void)shareClick:(UIButton *)btn
{
    NSLog(@"shareClick:%ld",(long)btn.tag);
    [self.delegate footViewDidSelect:PfootViewDidSelectBtn withData:[self.dataArray objectAtIndex:btn.tag - Btn_Tag]];

}
@end
