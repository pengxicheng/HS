//
//  Question.m
//  HengStars
//
//  Created by hengfu on 16/5/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "Question.h"
static CGFloat const margin = 10.f;
static CGFloat const contentFont = 14.f;
//static CGFloat const contentLabelY = margin + 30.f + margin; // 30是头像高度


@implementation Question{
    CGFloat _cellHeight;
}

+ (instancetype)questoineWithDic:(NSDictionary *)dic {
    Question *question = [[self alloc] init];
    [question setValuesForKeysWithDictionary:dic];
    return question;
}

- (CGFloat)cellHeight {
    if (!_cellHeight) {
        CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
        CGFloat contentQ = [self.questionString boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                      context:nil].size.height;
        CGFloat contentA = [self.answerString boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                       context:nil].size.height;
        _cellHeight = contentA + contentQ + 2 * margin;

        //_cellHeight += contentA + margin;

    }
    return _cellHeight;
}

@end
