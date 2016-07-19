//
//  BanerItem.m
//  MyBanner
//
//  Created by Peng xi cheng on 15/9/15.
//  Copyright (c) 2015年 com.hengfu. All rights reserved.
//

#import "BanerItem.h"

@implementation BanerItem

- (id)initWithTitle:(NSString*)title image:(NSString*)image tag:(NSInteger)tag
{
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.tag = tag;
    }

    return self;
}

- (id)initWithDict:(NSDictionary*)dict tag:(NSInteger)tag
{
    self = [super init];
    if (self) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            self.title = [dict objectForKey:@"href"];
            self.image = [dict objectForKey:@"src"];
            self.tag = tag;
            //...根据数据类型处理
        }
    }
    return self;
}

@end
