//
//  BannerView.m
//  MyBanner
//
//  Created by Peng xi cheng on 15/9/15.
//  Copyright (c) 2015年 com.hengfu. All rights reserved.
//

#import "BannerView.h"
#import "BanerItem.h"
#import "UIImageView+WebCache.h"
#import <objc/runtime.h>

#define ITEM_WIDTH SCREEN_WIDTH

@interface BannerView () {
    UIScrollView* _scrollView;
    UIPageControl* _pageControl;
}

- (void)setupViews;
- (void)switchFocusImageItems;
@end

static NSString* SG_FOCUS_ITEM_ASS_KEY = @"loopScrollview";

static CGFloat SWITCH_FOCUS_PICTURE_INTERVAL = 5.0; //switch interval time

@implementation BannerView
//@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<BannerViewDelegate>)delegate imageItems:(NSMutableArray*)items isAuto:(BOOL)isAuto
{
    self = [super initWithFrame:frame];
    if (self) {
//        NSMutableArray* imageItems = [NSMutableArray arrayWithArray:items];
//        objc_setAssociatedObject(self, (__bridge const void*)SG_FOCUS_ITEM_ASS_KEY, imageItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.arry = items;
        _isAutoPlay = isAuto;
        [self setupViews];
        self.delegate = delegate;
    }
    return self;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    float targetX = scrollView.contentOffset.x;
//    NSArray* imageItems = objc_getAssociatedObject(self, (__bridge const void*)SG_FOCUS_ITEM_ASS_KEY);
    if ([self.arry count] >= 3) {
        if (targetX >= ITEM_WIDTH * ([self.arry count] - 1)) {
            targetX = ITEM_WIDTH;
            [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:NO];
        }
        else if (targetX <= 0) {
            targetX = ITEM_WIDTH * ([self.arry count] - 2);
            [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:NO];
        }
    }
    int page = (_scrollView.contentOffset.x + ITEM_WIDTH / 2.0) / ITEM_WIDTH;
    //    NSLog(@"%f %d",_scrollView.contentOffset.x,page);
    if ([self.arry count] > 1) {
        page--;
        if (page >= _pageControl.numberOfPages) {
            page = 0;
        }
        else if (page < 0) {
            page = _pageControl.numberOfPages - 1;
        }
    }
    if (page != _pageControl.currentPage) {
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:currentItem:)]) {
            [self.delegate foucusImageFrame:self currentItem:page];
        }
    }
    _pageControl.currentPage = page;
}
- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
        targetX = (int)(targetX / ITEM_WIDTH) * ITEM_WIDTH;
        [self moveToTargetPosition:targetX];
    }
}


#pragma mark - private methods
- (void)setupViews
{
//    NSArray* imageItems = objc_getAssociatedObject(self, (__bridge const void*)SG_FOCUS_ITEM_ASS_KEY);
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.scrollsToTop = NO;
    float space = 0;
    CGSize size = CGSizeMake(ITEM_WIDTH, 0);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 16 - 10, ITEM_WIDTH, 10)];
    _pageControl.userInteractionEnabled = NO;
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];

    /*
     _scrollView.layer.cornerRadius = 10;
     _scrollView.layer.borderWidth = 1 ;
     _scrollView.layer.borderColor = [[UIColor lightGrayColor ] CGColor];
     */
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;

    _pageControl.numberOfPages = self.arry.count > 1 ? self.arry.count - 2 : self.arry.count;
    _pageControl.currentPage = 0;

    _scrollView.delegate = self;

    // single tap gesture recognizer
    UITapGestureRecognizer* tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tapGestureRecognize];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * self.arry.count, _scrollView.frame.size.height);

    for (int i = 0; i < self.arry.count; i++) {
        BanerItem* item = [self.arry objectAtIndex:i];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * _scrollView.frame.size.width + space, space, _scrollView.frame.size.width - space * 2, _scrollView.frame.size.height - 2 * space - size.height)];
        imageView.backgroundColor = [UIColor clearColor];
        //加载图片
        [imageView sd_setImageWithURL:[NSURL URLWithString:item.image] placeholderImage:[UIImage imageNamed:@"Banner_placehold"]];

        [_scrollView addSubview:imageView];
    }
    if ([self.arry count] > 1) {
        [_scrollView setContentOffset:CGPointMake(ITEM_WIDTH, 0) animated:NO];
        if (_isAutoPlay) {
            [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
        }
    }
}

-(void)resetData{
    [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
     float space = 0;
    CGSize size = CGSizeMake(ITEM_WIDTH, 0);
    _pageControl.numberOfPages = self.arry.count > 1 ? self.arry.count - 2 : self.arry.count;
    _pageControl.currentPage = 0;
    UITapGestureRecognizer* tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tapGestureRecognize];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * self.arry.count, _scrollView.frame.size.height);
    
    for (int i = 0; i < self.arry.count; i++) {
        BanerItem* item = [self.arry objectAtIndex:i];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * _scrollView.frame.size.width + space, space, _scrollView.frame.size.width - space * 2, _scrollView.frame.size.height - 2 * space - size.height)];
        imageView.backgroundColor = [UIColor clearColor];
        //加载图片
        [imageView sd_setImageWithURL:[NSURL URLWithString:item.image] placeholderImage:[UIImage imageNamed:@"Banner_placehold"]];
        
        [_scrollView addSubview:imageView];
    }

}

- (void)switchFocusImageItems
{

    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];

    CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
//    NSArray* imageItems = objc_getAssociatedObject(self, (__bridge const void*)SG_FOCUS_ITEM_ASS_KEY);
    targetX = (int)(targetX / ITEM_WIDTH) * ITEM_WIDTH;
    [self moveToTargetPosition:targetX];

    if ([self.arry count] > 1 && _isAutoPlay) {
        [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
    }
}

-(void)cancelFocusImageItems
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];

}

- (void)singleTapGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer
{
    NSLog(@"%s", __FUNCTION__);
//    NSArray* imageItems = objc_getAssociatedObject(self, (__bridge const void*)SG_FOCUS_ITEM_ASS_KEY);
    int page = (int)(_scrollView.contentOffset.x / _scrollView.frame.size.width);
    if (page > -1 && page < self.arry.count) {
        BanerItem* item = [self.arry objectAtIndex:page];
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:didSelectItem:)]) {
            [self.delegate foucusImageFrame:self didSelectItem:item];
        }
    }
}

- (void)moveToTargetPosition:(CGFloat)targetX
{
    BOOL animated = YES;
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:animated];
}


- (void)scrollToIndex:(int)aIndex
{
//    NSArray* imageItems = objc_getAssociatedObject(self, (__bridge const void*)SG_FOCUS_ITEM_ASS_KEY);
    if ([self.arry count] > 1) {
        if (aIndex >= ([self.arry count] - 2)) {
            aIndex = [self.arry count] - 3;
        }
        [self moveToTargetPosition:ITEM_WIDTH * (aIndex + 1)];
    }
    else {
        [self moveToTargetPosition:0];
    }
    [self scrollViewDidScroll:_scrollView];
}

@end
