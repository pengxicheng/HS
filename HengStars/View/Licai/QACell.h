//
//  QACell.h
//  HengStars
//
//  Created by hengfu on 16/5/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;
@interface QACell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionLable;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property(nonatomic,strong) Question *question;
@end
