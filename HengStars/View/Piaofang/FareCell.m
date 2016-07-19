//
//  FareCell.m
//  HengStars
//
//  Created by hengfu on 16/3/8.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "FareCell.h"

@implementation FareCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setInforWithDic:(NSDictionary*)dic indexColor :(NSInteger) i{
    if (dic) {
        self.fName.text = [dic objectForKey:@"name"];
        self.fTotle.text = [dic objectForKey:@"totals"];
        self.fRate.text = [dic objectForKey:@"attendance"];
        self.fare.text = [dic objectForKey:@"boxoffice"];
        if ( i%2 > 0) {
            self.contentView.backgroundColor = [UIColor grayColor];
        }else{
            self.contentView.backgroundColor = [UIColor whiteColor];
        }
    }
}
@end
