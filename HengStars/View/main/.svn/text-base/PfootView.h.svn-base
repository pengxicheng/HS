//
//  PfootView.h
//  HengStars
//
//  Created by Peng xi cheng on 16/5/8.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, PfootViewDidSelect) {
    PfootViewDidSelectView,
    PfootViewDidSelectBtn
};

@protocol PfootViewDelegate <NSObject>

- (void)footViewDidSelect:(PfootViewDidSelect)type withData:(id)data;

@end
@interface PfootView : UIView<UITableViewDataSource,UITableViewDelegate>
//恒星故事（标题）
@property(weak)id<PfootViewDelegate> delegate;
@property(strong,nonatomic)UIView *hotView;
@property(strong,nonatomic)UIImageView *imageView;
@property(strong,nonatomic)UILabel *titleLable;
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *dataArray;
- (instancetype)initWithFrame:(CGRect)frame;
-(void)setFootDataWithArray:(NSMutableArray *)data;
@end



