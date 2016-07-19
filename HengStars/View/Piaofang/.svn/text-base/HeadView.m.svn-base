//
//  HeadView.m
//  HengStars
//
//  Created by hengfu on 16/3/8.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView


-(UILabel *)fName
{
    if (_fName == nil) {
        self.fName = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 120, self.frame.size.height)];
        self.fName.textAlignment = NSTextAlignmentLeft;
        self.fName.textColor = [UIColor darkGrayColor];
        self.fName.backgroundColor = [UIColor lightGrayColor];
        self.backgroundColor = [UIColor lightGrayColor];
        self.fName.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.fName];
    }
    return _fName;
}
-(UILabel *)fTotle
{
    if (_fTotle == nil) {
        self.fTotle = [[UILabel alloc] initWithFrame:CGRectMake(135, 0, (SCREEN_WIDTH-135)/3, self.frame.size.height)];
        self.fTotle.textAlignment = NSTextAlignmentCenter;
        self.fTotle.textColor = [UIColor darkGrayColor];
        self.fTotle.font = [UIFont systemFontOfSize:11];
        self.fTotle.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.fTotle];
    }
    return _fTotle;
}
-(UILabel *)fRate
{
    if (_fRate == nil) {
        self.fRate = [[UILabel alloc] initWithFrame:CGRectMake(135 + (SCREEN_WIDTH-135)/3, 0, (SCREEN_WIDTH-135)/3, self.frame.size.height)];
        self.fRate.textAlignment = NSTextAlignmentCenter;
        self.fRate.textColor = [UIColor darkGrayColor];
        self.fRate.font = [UIFont systemFontOfSize:11];
        self.fRate.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.fRate];
    }
    return _fRate;
}
-(UILabel *)fare
{
    if (_fare == nil) {
        self.fare = [[UILabel alloc] initWithFrame:CGRectMake(135 + (SCREEN_WIDTH-135)/3*2, 0, (SCREEN_WIDTH-135)/3, self.frame.size.height)];
        self.fare.textAlignment = NSTextAlignmentCenter;
        self.fare.textColor = [UIColor darkGrayColor];
        self.fare.font = [UIFont systemFontOfSize:11];
        self.fare.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.fare];
    }
    return _fare;
}
@end
