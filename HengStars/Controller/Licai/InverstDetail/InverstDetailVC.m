//
//  InverstDetailVC.m
//  HengStars
//
//  Created by hengfu on 16/5/30.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "InverstDetailVC.h"
#import "LicaiDetailView.h"
@interface InverstDetailVC ()
@property (nonatomic,strong)LicaiDetailView * licaiDetailView;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation InverstDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.licaiDetailView = [[LicaiDetailView alloc] initWithFrame:self.view.bounds];

    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3050/f36e24875b193920795eb5bdf4f72021d2e9c42d?e=1457323058&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:0hpZBDB5OUNXQikmI5vKq63EDwY="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3117/3c51840a4cfb0b0879680bc51b2424487ed3be0c?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4FOjRZMmEh7yd9ovcY2L2outidc="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3114/884f05a11decad163a0fe5a65f7dc534746a482a?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:Lr0gEju29sqyryyUTWu428WT7sk="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3121/56a9c260f66623b8444427229e05b3fed0ab174b?e=1457323060&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:Rrwk4QaWCuh-a5kS2dFbyXoEzdE="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3125/3697aff2a0e8fcd7dac4de7e1a4e965aae311542?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:s8FieJboi3Baa12zwbyByEmqBxc="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3126/fef1976fb0a0479eb115f0f850805be68ffd8899?e=1457323060&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:STwYDZ4sxJoKrh8HsKQjuXdCELU="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3131/6c21720983e4a5a42e5af871893aedaef8d885fd?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4QKpAgTZsInH6N9EVTUP7WV1TdQ="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3144/e4f181eff737f731e366b694356922c8c809f2f5?e=1457407537&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:7a_gll8CSRe2_yoB5jRq3EFXFGE="];
    //    [self.dataArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3105/77fc6c260f63b27ee3f70447ef23ab4d5645e202?e=1457407538&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4h9FD0kebRFPPYreO2P3Fnerm6I="];
    NSMutableArray *zyArray = [NSMutableArray array];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3050/f36e24875b193920795eb5bdf4f72021d2e9c42d?e=1457323058&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:0hpZBDB5OUNXQikmI5vKq63EDwY="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3117/3c51840a4cfb0b0879680bc51b2424487ed3be0c?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4FOjRZMmEh7yd9ovcY2L2outidc="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3114/884f05a11decad163a0fe5a65f7dc534746a482a?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:Lr0gEju29sqyryyUTWu428WT7sk="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3121/56a9c260f66623b8444427229e05b3fed0ab174b?e=1457323060&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:Rrwk4QaWCuh-a5kS2dFbyXoEzdE="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3125/3697aff2a0e8fcd7dac4de7e1a4e965aae311542?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:s8FieJboi3Baa12zwbyByEmqBxc="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3126/fef1976fb0a0479eb115f0f850805be68ffd8899?e=1457323060&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:STwYDZ4sxJoKrh8HsKQjuXdCELU="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3131/6c21720983e4a5a42e5af871893aedaef8d885fd?e=1457322716&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4QKpAgTZsInH6N9EVTUP7WV1TdQ="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3144/e4f181eff737f731e366b694356922c8c809f2f5?e=1457407537&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:7a_gll8CSRe2_yoB5jRq3EFXFGE="];
    [zyArray addObject:@"http://owhat.qiniudn.com/uploads/event/cover1/3105/77fc6c260f63b27ee3f70447ef23ab4d5645e202?e=1457407538&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:4h9FD0kebRFPPYreO2P3Fnerm6I="];
    self.licaiDetailView.zhuchuangArray = zyArray;

    self.licaiDetailView.juzhaoArray = zyArray;

    self.licaiDetailView.gushiJianjieStr = @"钱钟书先生曾经把婚姻比作围城——外面的人想进去，而里面的人想出来。然而，无论是城里的人还是城外的人，在经历了无数次彷徨、纠结、痛苦、挣扎之后，真的应该扪心自问，我们为什么要结婚？我们要和什么样的人结婚？结婚究竟需要什么样的条件？什么样的婚姻才会是幸福的？等等等等…… 诚然，对于等等这些问题，没有人能给出什么标准的答案，但是这个故事，一定会让你有所启发，让你重新审视结婚的意义。 ";
    self.licaiDetailView.gap = 10;
    
    
    [self.licaiDetailView resetSizeAndCreatView];
    self.licaiDetailView.frame = [self.licaiDetailView calculateFrame];
    
    UIScrollView *scView = [[UIScrollView alloc] initWithFrame:self.bgView.bounds];
    [scView addSubview:self.licaiDetailView];
    scView.contentSize = CGSizeMake(SCREEN_WIDTH, self.licaiDetailView.frame.size.height);
    scView.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [self.bgView addSubview:scView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBar];
    
}
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
