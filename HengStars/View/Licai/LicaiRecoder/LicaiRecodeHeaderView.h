//
//  LicaiRecodeHeaderView.h
//  HengStars
//
//  Created by hengfu on 16/6/2.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LicaiRecodeHeaderView : UIView

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *content;


- (void)resetSizeAndCreatView;

- (CGRect)calculateFrame;
@end
