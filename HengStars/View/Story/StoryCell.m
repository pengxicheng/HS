//
//  StoryCell.m
//  HengStars
//
//  Created by hengfu on 16/5/6.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "StoryCell.h"

@implementation StoryCell

- (void)awakeFromNib {
    // Initialization code
    self.bgView.layer.cornerRadius = 4.0f;
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
        
    }

}

-(void)setTestInfor:(NSString*)str
{
    if (!str) {
        return;
    }
    if ([str isEqualToString:@"1"]) {

        self.titleLabel.text = @"万万没想到那一年我们欠下的电影票";
        self.storyImage.image = [UIImage imageNamed:@"hengfugushitu1"];
        self.content.text = @"我叫星姐，万万没想到，2015是姐欠债最多的一年，突然有一天，我发现自己欠了何炅一张电影票。后来，我发现我还欠了大鹏一张电影票。现在，终于轮到欠叫兽一张电影票....";
        self.readNum.text = @"886";
        
        
    }else
    {
        self.titleLabel.text = @"票房全面飘红资本跑步进入电影市场";
        self.storyImage.image = [UIImage imageNamed:@"hengfugushitu2"];
        self.content.text = @"票房破440亿元，业内普遍看好电影市场，据国家新闻出版广电总局电影局通报2015年全国....";
        self.readNum.text = @"686";
    }

}
@end
