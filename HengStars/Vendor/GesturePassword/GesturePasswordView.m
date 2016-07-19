//
//  GesturePasswordView.m
//  GesturePassword
//
//  Created by hb on 14-8-23.
//  Copyright (c) 2014年 黑と白の印记. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "GesturePasswordView.h"
#import "GesturePasswordButton.h"
#import "TentacleView.h"

@implementation GesturePasswordView {
    NSMutableArray * buttonArray;
    
    CGPoint lineStartPoint;
    CGPoint lineEndPoint;
    
}
@synthesize imgView;
@synthesize forgetButton;
@synthesize changeButton;
@synthesize nameLabel;
@synthesize registerLabel;

@synthesize tentacleView;
@synthesize state;
@synthesize gesturePasswordDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        buttonArray = [[NSMutableArray alloc]initWithCapacity:0];
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-160, frame.size.height/2-80, 320, 320)];
        
        if (frame.size.height<=480) {
            view.transform=CGAffineTransformMakeScale(1, 480/516.0);
        }
        
        for (int i=0; i<9; i++) {
            NSInteger row = i/3;
            NSInteger col = i%3;
            // Button Frame
            
            NSInteger distance = 320/3;
            NSInteger size = distance/1.5;
            NSInteger margin = size/4;
            GesturePasswordButton * gesturePasswordButton = [[GesturePasswordButton alloc]initWithFrame:CGRectMake(col*distance+margin, row*distance, size, size)];
            [gesturePasswordButton setTag:i];
            [view addSubview:gesturePasswordButton];
            [buttonArray addObject:gesturePasswordButton];
        }
        frame.origin.y=0;
        [self addSubview:view];
        tentacleView = [[TentacleView alloc]initWithFrame:view.frame];
        [tentacleView setButtonArray:buttonArray];
        [tentacleView setTouchBeginDelegate:self];
        [self addSubview:tentacleView];
        
        state = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/2-140, frame.size.height/2-160, 280, 30)];
        [state setTextAlignment:NSTextAlignmentCenter];
        [state setFont:[UIFont systemFontOfSize:14.f]];
        [self addSubview:state];
        
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-35, frame.size.width/2-100, 70, 70)];
        [imgView setBackgroundColor:[UIColor whiteColor]];
//        NSString * filePath = [[NSString alloc]initWithFormat:@"%@/%@.png",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],  [DBStore sharedInstance].userDict[@"userCode"]];
        NSString * filePath = [[NSString alloc]initWithFormat:@"%@/%@.png",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],  @"userCode"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            [imgView setImage:[UIImage imageWithContentsOfFile:filePath]];
        }
        else
        {
            UIImage * image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_avatar" ofType:@"png"]];
            [imgView setImage:image];
        }
        [self addSubview:imgView];
        

        
//        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2-75, frame.size.width/2-100 + 70 + 5, 150, 20)];
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 34 , self.bounds.size.width, 44)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:nameLabel];
        nameLabel.text = @"设置手势密码";
//        if ([DBStore sharedInstance].isLogin) {
//            nameLabel.text = [DBStore sharedInstance].userDict[@"userName"];
//        } else {
//            nameLabel.text = @"";
//        }
        
        registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height/2-199 , self.bounds.size.width, 44)];
        registerLabel.textAlignment = NSTextAlignmentCenter;
        registerLabel.backgroundColor = [UIColor clearColor];
        registerLabel.textColor = UIColorFromRGB(0x00ffff);
        registerLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:registerLabel];
        registerLabel.text = @"恭喜您注册成功";
        registerLabel.hidden=YES;
        
        forgetButton = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2-150, frame.size.height - 50, 120, 30)];
        [forgetButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [forgetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [forgetButton setTitle:@"忘记手势密码" forState:UIControlStateNormal];
        [forgetButton addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchDown];
        [self addSubview:forgetButton];
        
        changeButton = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2+30, frame.size.height - 50, 120, 30)];
        self.backgroundColor = [UIColor redColor];
        [changeButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [changeButton setTitle:@"重新登录" forState:UIControlStateNormal];
        [changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
        [self addSubview:changeButton];
        
        self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 70, self.bounds.size.width, 40)];
        self.tipLabel.text = @"为保证账户安全，请设置手势密码";
        self.tipLabel.textAlignment = NSTextAlignmentCenter;
        self.tipLabel.font = [UIFont systemFontOfSize:12];
        self.tipLabel.textColor = UIColorFromRGB(0x00ffff);
        [self.tipLabel setHidden:YES];
        [self addSubview:self.tipLabel];

    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        0.22, 0.56, 0.79, 1.0,
        0.13, 0.32, 0.59, 1.0,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
                                kCGGradientDrawsBeforeStartLocation);
}

- (void)gestureTouchBegin {
    [self.state setText:@""];
}

-(void)forget{
    [gesturePasswordDelegate forget];
}

-(void)change{
    [gesturePasswordDelegate change];
}


@end
