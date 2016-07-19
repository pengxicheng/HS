//
//  CommunityVC.m
//  HengStars
//
//  Created by hengfu on 16/3/11.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "CommunityVC.h"
#import "UMCommunity.h"
#import "UMComFeedTableViewController.h"
#import "UMComHomeFeedViewController.h"
@interface CommunityVC ()
@property(nonatomic,strong)UIButton *btn;

@end

@implementation CommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:self.btn];
    //[self btnAction:nil];

}

-(UIButton *)btn
{
    if (_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btn setTitle:@"进入社区" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor grayColor];
        _btn.frame = CGRectMake(0, 0, 100, 30);
        _btn.center = self.view.center;
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}


-(void)btnAction:(id)btn
{
    //NSLog(@"进入社区");
    UIViewController *communityViewController= [[UMComHomeFeedViewController alloc] init];
    //[UMCommunity getFeedsViewController];
//    UIViewController *communityViewController = [UMCommunity getFeedsViewController];
    communityViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:communityViewController animated:YES];
    //关注
//    UMComAllFeedsRequest *allFeedRequest = [[UMComAllFeedsRequest alloc] initWithCount:20];
//    [allFeedRequest fetchRequestFromServer:^(NSArray *data, BOOL haveNextPage, NSError *error) {
//        //返回消息、结果、是否有下一页
//        NSLog(@"feeds is %@",data);
//    }];
//    
//    //推荐
//    UMComRecommendFeedsRequest *recommendFeedRequest = [[UMComRecommendFeedsRequest alloc] initWithCount:20];
//    [recommendFeedRequest fetchRequestFromServer:^(NSArray *data, BOOL haveNextPage, NSError *error) {
//        //返回消息、结果、是否有下一页
//        NSLog(@"feeds is %@",data);
//    }];
//    
//    //话题
//    UMComAllTopicsRequest *allTopicsRequest = [[UMComAllTopicsRequest alloc] initWithCount:1000];
//    [allTopicsRequest fetchRequestFromServer:^(NSArray *data, BOOL haveNextPage, NSError *error) {
//        //返回消息、结果、是否有下一页
//        NSLog(@"feeds is %@",data);
//    }];
//    //我的
//    UMComFriendFeedsRequest *friendFeedsRequest = [[UMComFriendFeedsRequest alloc] initWithCount:20];
//    [friendFeedsRequest fetchRequestFromServer:^(NSArray *data, BOOL haveNextPage, NSError *error) {
//        //返回消息、结果、是否有下一页
//        NSLog(@"feeds is %@",data);
//    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
