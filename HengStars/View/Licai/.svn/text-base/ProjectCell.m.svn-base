//
//  ProjectCell.m
//  HengStars
//
//  Created by hengfu on 16/5/5.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "ProjectCell.h"

@implementation ProjectCell

- (void)awakeFromNib {
    // Initialization code
    self.bgView.layer.cornerRadius = 4.0f;//圆角处理
    self.bgView.layer.borderColor = UIColorFromRGB(0xe6e6e6).CGColor;
    self.bgView.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCellInfor:(NSDictionary *)dic
{
    if (dic) {
        //进行数据设置
    }
}

-(void)setTestInfor:(NSString*)str
{
    if (!str) {
        return;
    }
    if ([str isEqualToString:@"1"]) {
//        @property (weak, nonatomic) IBOutlet UIImageView *stateImage;
//        
//        @property (weak, nonatomic) IBOutlet UIImageView *projectImage;
//        @property (weak, nonatomic) IBOutlet UILabel *actorLabel;
//        @property (weak, nonatomic) IBOutlet UIButton *detailBtn;
        self.stateImage.image = [UIImage imageNamed:@"biaoqian"];
        self.projectImage.image = [UIImage imageNamed:@"hunyin"];
        self.actorLabel.text = @"田雷、张萌、纪宁、苗洛依等";
        
        
    }else
    {
        self.stateImage.image = [UIImage imageNamed:@"biaoqian_rengou"];
        self.projectImage.image = [UIImage imageNamed:@"zhubo"];
        self.actorLabel.text = @"王李丹妮、莫绮雯、梁中正等";
        

    }
    
}

@end
