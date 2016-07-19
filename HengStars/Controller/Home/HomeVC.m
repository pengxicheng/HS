//
//  HomeVC.m
//  HengStars
//
//  Created by hengfu on 16/3/9.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "HomeVC.h"
#import "NSData+SDDataCache.h"
#import "UIColor+CreateImage.h"
#import <RongIMKit/RongIMKit.h>
@interface HomeVC ()
@property(strong,nonatomic) UILabel *cashesLabel;
@property(strong,nonatomic) UIButton *cashesDelBtn;
@property(strong,nonatomic)UIButton *kefuBtn;
//定位:b77408f9cffd861d1481d7efb115da31

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    [self.cashesDelBtn addTarget:self action:@selector(deleteCache:) forControlEvents:UIControlEventTouchUpInside];
//    [self.kefuBtn addTarget:self action:@selector(oneKeyKF:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.cashesLabel.text = [NSString stringWithFormat:@"%.1fM",[self filePath]];
    [self setNavigationBarClear];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//一键客服测试
-(UIButton *)kefuBtn
{
    if (_kefuBtn == nil) {
        _kefuBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 30)];
        [_kefuBtn setTitle:@"一键客服" forState:UIControlStateNormal];
        _kefuBtn.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_kefuBtn];
    }
    return _kefuBtn;
}

//显示缓存
-(UILabel *)cashesLabel
{
    if (_cashesLabel == nil) {
        _cashesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 60)];
        _cashesLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_cashesLabel];
    }
    return _cashesLabel;
}

//清除缓存
-(UIButton *)cashesDelBtn
{
    if (_cashesDelBtn == nil) {
        _cashesDelBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 100, 30)];
        [_cashesDelBtn setTitle:@"清除缓存" forState:UIControlStateNormal];
        _cashesDelBtn.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_cashesDelBtn];
    }
    return _cashesDelBtn;
}

//一键客服
-(void)oneKeyKF:(id)sender
{
    NSLog(@"一键客服");
    
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    NSString *deviceToken=[ud objectForKey:@"device_Token"];
    //融云

    /**
     * 参数说明
     *
     * conversationType 会话类型，此处应该传 RCConversationType.ConversationType_APPSERVICE
     * targetId 客服 Id
     * userName 客服名称
     * title 客服会话界面 Title
     */
    
    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    //设置会话的类型，客服2.0的会话类型为ConversationType_APPSERVICE
    chat.conversationType = ConversationType_APPSERVICE;
    //设置会话的目标会话ID，客服2.0的目标会话ID为您在开发者控制台拿到的客服ID
    chat.targetId = @"KEFU145826488234842";
    //设置聊天会话界面要显示的标题
    chat.title = @"客服";
    chat.hidesBottomBarWhenPushed = YES;
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];

}
//清除缓存
-(void)deleteCache:(id)sender
{
    [self clearFile];
    self.cashesLabel.text = [NSString stringWithFormat:@"%.1fM",[self filePath]];

}


// 显示缓存大小
-( float )filePath
{
    
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    return [ self folderSizeAtPath :cachPath];
    
}
//1:首先我们计算一下 单个文件的大小

- ( long long ) fileSizeAtPath:( NSString *) filePath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if ([manager fileExistsAtPath :filePath]){
        
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize ];
    }
    
    return 0 ;
    
}
//2:遍历文件夹获得文件夹大小，返回多少 M（提示：你可以在工程界设置（)m）

- ( float ) folderSizeAtPath:( NSString *) folderPath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    
    NSString * fileName;
    
    long long folderSize = 0 ;
    
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
        
    }
    
    return folderSize/( 1024.0 * 1024.0 );
    
}



//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1 && alertView.tag == 1011) {
//        [self clearFile];
//        
//    }
//}

// 清理缓存

- (void)clearFile
{
    
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    NSArray * files = [[ NSFileManager defaultManager ] subpathsAtPath :cachPath];
    
    NSLog ( @"cachpath = %@" , cachPath);
    
    for ( NSString * p in files) {
        
        NSError * error = nil ;
        
        NSString * path = [cachPath stringByAppendingPathComponent :p];
        
        if ([[ NSFileManager defaultManager ] fileExistsAtPath :path]) {
            
            [[ NSFileManager defaultManager ] removeItemAtPath :path error :&error];
            
        }
        
    }
    
    [ self performSelectorOnMainThread : @selector (clearCachSuccess) withObject : nil waitUntilDone : YES ];
    
}
-(void)clearCachSuccess
{
    NSLog ( @" 清理成功 " );
}


@end
