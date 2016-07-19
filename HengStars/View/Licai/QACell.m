//
//  QACell.m
//  HengStars
//
//  Created by hengfu on 16/5/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "QACell.h"
#import "Question.h"
@implementation QACell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setQuestion:(Question *)question
{
    _question = question;
    self.questionLable.text = _question.questionString;
    self.answerLabel.text = _question.answerString;
    

}
@end
