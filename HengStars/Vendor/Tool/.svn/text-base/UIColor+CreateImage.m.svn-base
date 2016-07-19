//
//  UIColor+CreateImage.m
//  HengFu
//
//  Created by Peng xi cheng on 15/9/24.
//  Copyright (c) 2015年 Panda. All rights reserved.
//

#import "UIColor+CreateImage.h"

@implementation UIColor (CreateImage)
- (UIImage *)imageWithFrame:(CGRect)frame {
    
    UIImage *image = nil;
    
    if (self) {
        
        UIView *view         = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = self;
        
        UIGraphicsBeginImageContext(view.frame.size);
        [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return image;
}
@end
