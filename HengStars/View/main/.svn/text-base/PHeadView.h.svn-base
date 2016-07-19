//
//  PHeadView.h
//  HengStars
//
//  Created by hengfu on 16/5/6.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BanerItem.h"
#import "BannerView.h"


typedef NS_ENUM(NSInteger, DidSelectype) {
    DidSelecBanner,
    DidSelecNotic,
    DidSelecBtn
};
@protocol PHeadViewDelegate <NSObject>

-(void)didSelectType:(DidSelectype) type  withData:(id)data;

@end

@interface PHeadView : UIView<UITableViewDataSource,UITableViewDelegate,BannerViewDelegate>
{
    int currentIndex;
}
@property(weak)id <PHeadViewDelegate> delegeta;
//banner
@property(nonatomic,strong)UIView* bgView;
@property (nonatomic, strong) BannerView* bannerView;
//消息
@property(nonatomic,strong)UIView *noticeView;
@property(nonatomic,strong)UIImageView *noticeImage;
@property(nonatomic,strong)UIImageView *nextImage;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSTimer* timer;
//两个按钮
//@property(nonatomic,strong)UIView *btnView;

@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIImageView *leftImage;
@property(nonatomic,strong)UILabel *leftLable;
@property(nonatomic,strong)UIButton *leftButton;

@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIImageView *rightImage;
@property(nonatomic,strong)UILabel *rightLable;
@property(nonatomic,strong)UIButton *rightButton;

//火热项目的view
@property(nonatomic,strong)UIView *hotView;
@property(nonatomic,strong)UIImageView *hotImage;
@property(nonatomic,strong)UILabel *hotLabel;


//数据源
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *bannerData;
//设置banner的方法

- (void)initBannerView:(NSMutableArray*)bArray;
//设置消息的方法
-(void)setNoticeData:(NSMutableArray *)noticeData;

- (instancetype)initWithFrame:(CGRect)frame;
@end
