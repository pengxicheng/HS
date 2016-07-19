//
//  BannerView.h
//  MyBanner
//
//  Created by Peng xi cheng on 15/9/15.
//  Copyright (c) 2015年 com.hengfu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BanerItem;
@class BannerView;

#pragma mark - SGFocusImageFrameDelegate
@protocol BannerViewDelegate <NSObject>
@optional
- (void)foucusImageFrame:(BannerView*)imageFrame didSelectItem:(BanerItem*)item;
- (void)foucusImageFrame:(BannerView*)imageFrame currentItem:(int)index;

@end

@interface BannerView : UIView <UIGestureRecognizerDelegate, UIScrollViewDelegate> {
    BOOL _isAutoPlay;
}
- (id)initWithFrame:(CGRect)frame delegate:(id<BannerViewDelegate>)delegate imageItems:(NSMutableArray*)items isAuto:(BOOL)isAuto;

- (void)scrollToIndex:(int)aIndex;
-(void)cancelFocusImageItems;
- (void)switchFocusImageItems;
-(void)resetData;

@property (nonatomic, assign) id<BannerViewDelegate> delegate;
@property(nonatomic,strong)NSMutableArray *arry;

@end
