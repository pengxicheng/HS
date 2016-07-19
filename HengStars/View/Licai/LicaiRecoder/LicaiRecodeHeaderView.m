//
//  LicaiRecodeHeaderView.m
//  HengStars
//
//  Created by hengfu on 16/6/2.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "LicaiRecodeHeaderView.h"
#define GAP 10
@interface LicaiRecodeHeaderView ()
@property(nonatomic,strong)UIView *tView;
@property(nonatomic,strong)UIView *mView;
@property(nonatomic,strong)UIView *dView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *contentLab;
@end
@implementation LicaiRecodeHeaderView


- (void)resetSizeAndCreatView{
    //间隙(顶部视图)
    self.tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, GAP)];
    self.tView.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [self addSubview:self.tView];
    
    
    
    //中部视图
    self.mView = [[UIView alloc] initWithFrame:CGRectMake(0, GAP, SCREEN_WIDTH, 80)];
    [self addSubview:self.mView];
     UIView *titleF = [self creatTitleView:@"领投机构" pic:@"ltjg"];
    [self.mView addSubview:titleF];
    
    //logo图片
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, titleF.frame.size.height, 60, 50)];
    logoView.image = [UIImage imageNamed:@"lg"];
    [self.mView addSubview:logoView];
    
    //标题
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15 + logoView.frame.size.width, titleF.frame.size.height, SCREEN_WIDTH - (30 + logoView.frame.size.width), 50)];
    if (self.title) {
        self.titleLab.text = self.title;
        self.titleLab.font = [UIFont systemFontOfSize:15.f];
    }
    [self.mView addSubview:self.titleLab];
    
    //内容
    self.contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, logoView.frame.size.height + 5, SCREEN_WIDTH, 0)];
    if (self.content) {
         //赋值并计算高度
        self.contentLab.text = self.content;
        self.contentLab.numberOfLines = 0;
        self.contentLab.font = [UIFont systemFontOfSize:12.f];
        self.contentLab.frame = CGRectMake(20, logoView.frame.size.height + 20, SCREEN_WIDTH - 40, [self calculateStringHeight:self.content FontSize:12.f]) ;
        self.mView.frame = CGRectMake(0, GAP, SCREEN_WIDTH, 90 + self.contentLab.frame.size.height);
    }
    [self.mView addSubview:self.contentLab];
    
    //GAP
    UIView *gapTView = [[UIView alloc] initWithFrame:CGRectMake(0, self.mView.frame.origin.y + self.mView.frame.size.height, SCREEN_WIDTH, GAP)];
    gapTView.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [self addSubview:gapTView];
    
    //底部View
    self.dView = [[UIView alloc] initWithFrame:CGRectMake(0, gapTView.frame.origin.y + gapTView.frame.size.height, SCREEN_WIDTH, 55)];
    [self addSubview:self.dView];
    
    //跟踪记录log标题
    UIView *logViewTitle = [self creatTitleView:@"跟投记录" pic:@"gtjl"];
    [self.dView addSubview:logViewTitle];
    
    //tableView标题
    for(int i = 0; i < 3; i++)
    {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0 + i * SCREEN_WIDTH/3, 35, SCREEN_WIDTH/3, 20)];
        lab.font = [UIFont systemFontOfSize:13.f];
        lab.textColor = [UIColor darkTextColor];
        lab.textAlignment = NSTextAlignmentCenter;
        switch (i) {
            case 0:
            {
                lab.text = @"跟投人";
            
            }
                break;
            case 1:
            {
                lab.text = @"投资金额(元)";
                
            }
                break;
            case 2:
            {
                lab.text = @"投资日期";
                
            }
                break;
            default:
                break;
        }
        
        [self.dView addSubview:lab];
    }
    

}

- (CGRect)calculateFrame{
    CGFloat selfViewHeight = 0;
    if (self.tView) {
        selfViewHeight = self.tView.frame.size.height + GAP;
    }
    
    if (self.mView) {
        selfViewHeight += self.mView.frame.size.height;
    }
    
    if (self.dView) {
        selfViewHeight += self.dView.frame.size.height + GAP;
    }
    CGRect rect            = self.frame;
    rect.size.height       = selfViewHeight;

    return rect;

}

#pragma mark 私有方法 创建每个分栏主题

-(UIView *)creatTitleView:(NSString *)title pic:(NSString *)picName
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    imageView.image = [UIImage imageNamed:picName];
    
    [view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, SCREEN_WIDTH - 50, 29)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:13.f];
    [view addSubview:label];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 29, SCREEN_WIDTH - 40, 1)];
    lineView.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [view addSubview:lineView];
    
    return view;
    
}


- (CGFloat)calculateStringHeight:(NSString *) str FontSize:(CGFloat) size {
    
    if (!str || str.length == 0) {
        return 0;
    }
    
    // 字体
    if (size == 0) {
        size = 12.f;
    }
    
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * 20; // 屏幕宽度减去左右间距
    CGFloat contentQ = [str boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]}
                                         context:nil].size.height;
    
    return contentQ;
}
@end

