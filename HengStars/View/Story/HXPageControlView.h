//
//  HXPageControlView.h
//  TestReactiveCocoa
//
//  Created by hengfu on 16/5/20.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,PageControlItemStyle){
    PageControlItemStyleDefaulType,
    PageControlItemStyleTitle

};
@interface HXPageControlView : UIView
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,assign)NSInteger lastPage;
@property(nonatomic,assign)NSInteger totalPages;

@property(nonatomic,strong)UIColor *selectedColor;
@property(nonatomic,strong)UIColor *unselectedColor;
@property(nonatomic,strong)NSMutableArray *indexesOfNotices;

@property(nonatomic,assign)PageControlItemStyle pageControlItemType;

@property(nonatomic,copy) void(^didSelectedAtIndexBlock)(NSInteger indec);


- (id)initWithFrame:(CGRect)frame totalPages:(NSInteger)totalPages currentPage:(NSInteger)currentPage;

- (id)initWithFrame:(CGRect)frame itemTitles:(NSArray *)itemTitles currentPage:(NSInteger)currentPage;

- (id)initWithFrame:(CGRect)frame itemImages:(NSArray *)itemImages currentPage:(NSInteger)currentPage;

- (void)setItemTitles:(NSArray *)itemTitles;
- (void)setItemImages:(NSArray *)itemImages;

//刷新pages
- (void)reloadPages;
@end


@interface HXpageNumberView : UIView
@property(nonatomic, strong) UIColor *itemColor;
@property(nonatomic, strong) UIImageView *itemImageView;
@property(nonatomic, strong) UILabel *itemLabel;
@property(nonatomic, strong) UIImageView *itemNoticeImageView;

@property(nonatomic, assign)PageControlItemStyle itemType;
@property(nonatomic, copy) void (^clickOnItem)(NSInteger index);
@property(nonatomic, assign) NSInteger index;

@end