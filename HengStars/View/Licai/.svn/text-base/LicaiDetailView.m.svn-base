//
//  LicaiDetailView.m
//  HengStars
//
//  Created by hengfu on 16/6/1.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "LicaiDetailView.h"
#import "UIImageView+WebCache.h"
typedef enum : NSUInteger {
    ONE_BUTTON = 0x2244,
    TWO_BUTTON = 0x3344,
} ENUM_FLAG;
#define GAP_IMAGE 5
@interface LicaiDetailView ()
@property(nonatomic,strong) UIView *zhuchuanView;
@property(nonatomic,strong) UIScrollView * zhuchuanSCView;

@property(nonatomic,strong) UIView * juzhaoView;
@property(nonatomic,strong) UIScrollView * juzhaoSCView;

@property(nonatomic,strong)UIView *gushiJianjieView;
@property(nonatomic,strong)UIView *jinduView;

//

@end
@implementation LicaiDetailView




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
 - (void)resetSizeAndCreatView
{
    //默认参数判断及设置
    if (self.gap == 0) {
        self.gap = 10.f;
    }
    if (self.zhuchuangHight  == 0) {
        self.zhuchuangHight = 70.f;
    }
    if (self.zhuchuangImageWith == 0) {
        self.zhuchuangImageWith = 35.f;
    }
    
    if (self.juzhaoHight  == 0) {
        self.juzhaoHight = 30.f;
    }
    if (self.juzhaoWith  == 0) {
        self.juzhaoWith = 60.f;
    }
    //1、创建第一个View
    if (self.zhuchuangArray && self.zhuchuangArray.count > 0) {
        self.zhuchuanView = [[UIView alloc] initWithFrame:CGRectMake(0, self.gap, SCREEN_WIDTH, 50 + self.zhuchuangHight)];
        self.zhuchuanView .backgroundColor = UIColorFromRGB(0xe6e6e6);
        UIView *titleView = [self creatTitleView:@"主创团队" pic:@"zctd"];
        [self.zhuchuanView addSubview:titleView];
        
        self.zhuchuanSCView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, titleView.frame.size.height + 10, SCREEN_WIDTH - 20, self.zhuchuangHight + 10)];
        self.zhuchuanSCView.showsHorizontalScrollIndicator = false;
        for (int i = 0; i < self.zhuchuangArray.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * (self.zhuchuangImageWith + GAP_IMAGE), 0, self.zhuchuangImageWith, self.zhuchuangHight)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[self.zhuchuangArray objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"Banner_placehold"]];
            [self.zhuchuanSCView addSubview:imageView];
            
        }
        self.zhuchuanSCView.contentSize = CGSizeMake(self.zhuchuangArray.count * (self.zhuchuangImageWith + GAP_IMAGE), self.zhuchuangHight);
        [self.zhuchuanView addSubview:self.zhuchuanSCView];
        [self addSubview:self.zhuchuanView];
    }
    
    //2、创建项目剧照
    if (self.juzhaoArray && self.juzhaoArray.count > 0) {
        CGFloat hight = 0;
        if (self.zhuchuanView) {
            hight = self.zhuchuanView.frame.size.height + self.gap;
        }
        self.juzhaoView = [[UIView alloc] initWithFrame:CGRectMake(0, hight, SCREEN_WIDTH, 50 + self.juzhaoHight)];
        self.juzhaoView .backgroundColor = UIColorFromRGB(0xe6e6e6);
        UIView *titleView = [self creatTitleView:@"项目剧照" pic:@"zmjz"];
        [self.juzhaoView addSubview:titleView];
        
        self.juzhaoSCView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, titleView.frame.size.height + 10, SCREEN_WIDTH - 20, self.juzhaoHight + 10)];
        self.juzhaoSCView.showsHorizontalScrollIndicator = false;
        for (int i = 0; i < self.juzhaoArray.count; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * (self.juzhaoWith + GAP_IMAGE), 10, self.juzhaoWith, self.juzhaoHight)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[self.juzhaoArray objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"Banner_placehold"]];
            [self.juzhaoSCView addSubview:imageView];
        }
        self.juzhaoSCView.contentSize = CGSizeMake(self.juzhaoArray.count * (self.juzhaoWith + GAP_IMAGE), self.juzhaoHight);
        [self.juzhaoView addSubview:self.juzhaoSCView];
        [self addSubview:self.juzhaoView];
    }
    
    //创建故事梗概实体
    if(self.gushiJianjieStr && self.gushiJianjieStr.length > 0){
        CGFloat hight = 0;
        if (self.zhuchuanView) {
            hight = self.zhuchuanView.frame.size.height + self.gap;
        }
        if (self.juzhaoView) {
            hight += self.juzhaoView.frame.size.height + self.gap;
        }
        
        self.gushiJianjieView = [[UIView alloc] initWithFrame:CGRectMake(0, hight, SCREEN_WIDTH, 30)];
        self.gushiJianjieView.backgroundColor = UIColorFromRGB(0xe6e6e6);
        UIView *titleView = [self creatTitleView:@"故事梗概" pic:@"gsgg"];
        [self.gushiJianjieView addSubview: titleView];
        
        CGFloat lableHight = [self calculateStringHeight:self.gushiJianjieStr FontSize:12.f];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, titleView.frame.size.height + 5, SCREEN_WIDTH - 20, lableHight + 10)];
        label.text = self.gushiJianjieStr;
        label.font = [UIFont systemFontOfSize:12.f];
        label.textColor = [UIColor darkGrayColor];
        label.numberOfLines = 0;
        [self.gushiJianjieView addSubview:label];
        
        self.gushiJianjieView.frame = CGRectMake(0, hight, SCREEN_WIDTH, titleView.frame.size.height + lableHight + 10);
        [self addSubview:self.gushiJianjieView];
    }
    //进度安排
    if (self.jinduArray && self.jinduArray.count > 0) {
        
        CGFloat hight = 0;
        if (self.zhuchuanView) {
            hight = self.zhuchuanView.frame.size.height + self.gap;
        }
        if (self.juzhaoView) {
            hight += self.juzhaoView.frame.size.height + self.gap;
        }
        if (self.gushiJianjieView) {
            hight += self.gushiJianjieView.frame.size.height + self.gap;
        }
        
        self.jinduView = [[UIView alloc] initWithFrame:CGRectMake(10, hight, SCREEN_WIDTH - 20, 200)];
        
    }
    

}


- (CGRect)calculateFrame
{
    CGFloat selfViewHeight = 0;
    if (self.zhuchuanView) {
        selfViewHeight = self.zhuchuanView.frame.size.height + self.gap;
    }
    
    if (self.juzhaoView) {
        selfViewHeight += self.juzhaoView.frame.size.height + self.gap;
    }
    
    if (self.gushiJianjieView) {
        selfViewHeight += self.gushiJianjieView.frame.size.height + self.gap;
    }
    if (self.jinduView) {
        selfViewHeight += self.jinduView.frame.size.height + self.gap;
    }
    CGRect rect            = self.frame;
    rect.size.height       = selfViewHeight;
    
    // 返回控件
    return rect;
    //return CGRectMake(0, 0, 0, 0);

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

    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * 10; // 屏幕宽度减去左右间距
    CGFloat contentQ = [str boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]}
                                                         context:nil].size.height;

    return contentQ;
}
@end

