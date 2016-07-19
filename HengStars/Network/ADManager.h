//
//  ADManager.h
//  HengStars
//
//  Created by hengfu on 16/4/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADManager : NSObject
+ (BOOL)isShouldDisplayAd;
+ (UIImage *)getAdImage;
+ (void)loadLatestAdImage;
@end
