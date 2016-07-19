//
//  GesturePasswordController.m
//  GesturePassword
//
//  Created by hb on 14-8-23.
//  Copyright (c) 2014年 黑と白の印记. All rights reserved.
//



#import <Security/Security.h>
#import <CoreFoundation/CoreFoundation.h>
#import "objc/runtime.h"

#import "GesturePasswordController.h"


#import "KeychainItemWrapper/KeychainItemWrapper.h"

@interface GesturePasswordController ()

@property (strong, nonatomic) UITabBarController *mainTabbarViewController;
@property (nonatomic,strong) GesturePasswordView * gesturePasswordView;
@property (nonatomic, assign) NSInteger nowTimes;
@property (nonatomic, strong) UILabel * label;

@end

@implementation GesturePasswordController {
    NSString * previousString;
    NSString * password;
    NSString * userID;
}

@synthesize gesturePasswordView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    previousString = [NSString string];
    //userID=[DBStore sharedInstance].userDict[@"userCode"];
    
//    KeychainItemWrapper * namekeychin = [[KeychainItemWrapper alloc]initWithIdentifier:userID accessGroup:nil];
//    NSString * nameId = [namekeychin objectForKey:(__bridge id)kSecValueData];
    
//    if ([nameId isEqual:[DBStore sharedInstance].userDict[@"userCode"]]) {
//        
//        KeychainItemWrapper * rebase = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture.b" accessGroup:nil];
//        NSString * str = [rebase objectForKey:(__bridge id)kSecValueData];
//        
//        KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture" accessGroup:nil];
//        [keychin setObject:@"<帐号>" forKey:(__bridge id)kSecAttrAccount];
//        [keychin setObject:str forKey:(__bridge id)kSecValueData];
//    }
    
    KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:userID accessGroup:nil];
    password = [keychin objectForKey:(__bridge id)kSecValueData];
    
    if ([password isEqualToString:@""]) {
        
        [self reset];
    }
    else {
        [self verify];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 验证手势密码
- (void)verify{
    
    gesturePasswordView = [[GesturePasswordView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [gesturePasswordView.state setText:@"请验证您的手势密码"];
    [gesturePasswordView.nameLabel setText:@"验证手势密码"];
    [gesturePasswordView.state setTextColor:UIColorFromRGB(0x00ffff)];
//    [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
    [gesturePasswordView.tentacleView setRerificationDelegate:self];
    [gesturePasswordView.tentacleView setStyle:1];
    [gesturePasswordView setGesturePasswordDelegate:self];
    [gesturePasswordView.imgView setHidden:YES];
    [gesturePasswordView.tipLabel setHidden:YES];
    [self.view addSubview:gesturePasswordView];
}

#pragma mark - 重置手势密码
- (void)reset{
    gesturePasswordView = [[GesturePasswordView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [gesturePasswordView.state setText:@"请绘制新的手势密码"];
    [gesturePasswordView.state setTextColor:UIColorFromRGB(0x00ffff)];
//    [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
    [gesturePasswordView.tentacleView setResetDelegate:self];
    [gesturePasswordView.tentacleView setStyle:2];
    [gesturePasswordView.imgView setHidden:YES];
    [gesturePasswordView.forgetButton setHidden:YES];
    [gesturePasswordView.changeButton setHidden:YES];
    [gesturePasswordView.tipLabel setHidden:NO];
    if (self.isRegister) {
        gesturePasswordView.registerLabel.hidden=NO;
    }
    [self.view addSubview:gesturePasswordView];
}

#pragma mark - 判断是否已存在手势密码
- (BOOL)exist{
    KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc] initWithIdentifier:userID accessGroup:nil];
    password = [keychin objectForKey:(__bridge id)kSecValueData];
    if ([password isEqualToString:@""])return NO;
    return YES;
}

#pragma mark - 清空记录
- (void)clear{
    //userID=[DBStore sharedInstance].userDict[@"userCode"];
    KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc] initWithIdentifier:userID accessGroup:nil];
    [keychin resetKeychainItem];
}

- (BOOL)verification:(NSString *)result{
    if ([result isEqualToString:password]) {
        self.nowTimes = 0;
        [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [gesturePasswordView.state setText:@"输入正确"];
        [self dismissViewControllerAnimated:YES completion:nil];
        return YES;
    }
    self.nowTimes += 1;
    if (self.nowTimes == 5) {
//        [DBStore sharedInstance].isLogin = NO;
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"信息" message:@"手势密码错误, 请使用帐号重新登录!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        [alert.rac_buttonClickedSignal subscribeNext:^(id x) {
//            [self dismissViewControllerAnimated:YES completion:^{
//              
//            }];
//        }];
    }
    [gesturePasswordView.state setTextColor:[UIColor redColor]];
    [gesturePasswordView.state setText:[NSString stringWithFormat:@"手势密码错误, 剩余%ld次", 5 - self.nowTimes]];

    return NO;
}

- (BOOL)resetPassword:(NSString *)result{
    if ([previousString isEqualToString:@""] && result.length < 4) {
        previousString =@"";
        [gesturePasswordView.state setTextColor:[UIColor redColor]];
        [gesturePasswordView.state setText:@"请至少绘制4个点"];
        return NO;
    }
    
    if ([previousString isEqualToString:@""]) {
        previousString=result;
        [gesturePasswordView.tentacleView enterArgin];
//        [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [gesturePasswordView.state setTextColor:UIColorFromRGB(0x00fffff)];
        [gesturePasswordView.state setText:@"再次确认手势密码"];
        return YES;
    }
    else {
        if ([result isEqualToString:previousString]) {
            KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:userID accessGroup:nil];
            [keychin setObject:userID forKey:(__bridge id)kSecAttrAccount];
            [keychin setObject:result forKey:(__bridge id)kSecValueData];
            
//            KeychainItemWrapper * rebase = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture.b" accessGroup:nil];
//            [rebase setObject:@"<帐号rebase>" forKey:(__bridge id)kSecAttrAccount];
//            [rebase setObject:result forKey:(__bridge id)kSecValueData];
            
//            KeychainItemWrapper * namekeychin = [[KeychainItemWrapper alloc]initWithIdentifier:@"HFUserId" accessGroup:nil];
//            [namekeychin setObject:@"<用户id>" forKey:(__bridge id)kSecAttrAccount];
//            [namekeychin setObject:[DBStore sharedInstance].userDict[@"userCode"] forKey:(__bridge id)kSecValueData];

            //[self presentViewController:(UIViewController) animated:YES completion:nil];
//            [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
            [gesturePasswordView.state setTextColor:UIColorFromRGB(0x00fffff)];
            [gesturePasswordView.state setText:@"设置成功"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [self dismissViewControllerAnimated:YES completion:nil];
            });
            return YES;
        }
        else{
            previousString =@"";
            [gesturePasswordView.state setTextColor:[UIColor redColor]];
            [gesturePasswordView.state setText:@"错误,两次设置手势密码不相符"];
            return NO;
        }
    }
}

#pragma mark - 重新登录
- (void)change{
    [self dismissViewControllerAnimated:YES completion:^{
        [self initaHeader];
        //[DBStore sharedInstance].isLogin = NO;
        NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
        NSString *deviceToken=[ud objectForKey:@"device_Token"];
        if (deviceToken) {
//            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//            NSDictionary *parameters = @{@"userCode": @"",@"deviceType":@"ios",@"tokens":deviceToken};
//            [manager POST:KApppush parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"JSON: %@", responseObject);
//                
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                NSLog(@"Error: %@", error);
//            }];
            
        }
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:[[UIStoryboard storyboardWithName:@"Register" bundle:nil] instantiateViewControllerWithIdentifier:@"login"]];
        nav.navigationBarHidden = YES;
//        AppDelegate *del=[UIApplication sharedApplication].delegate;
//        self.mainTabbarViewController=del.mainTabbarViewController;
//        self.mainTabbarViewController.selectedIndex=0;
//        [self.mainTabbarViewController.selectedViewController presentViewController:nav animated:YES completion:nil];
    }];


}

#pragma mark - 忘记手势密码
- (void)forget{
    UIViewController * vc = [[UIStoryboard storyboardWithName:@"Setting" bundle:nil] instantiateViewControllerWithIdentifier:@"vf"];
    objc_setAssociatedObject(vc, @"gesture", @(YES), OBJC_ASSOCIATION_RETAIN);
    [self presentViewController:vc animated:NO completion:nil];
    
}


- (void)initaHeader
{
    UIImage * image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_avatar" ofType:@"png"]];
    
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/head.png"] contents:UIImagePNGRepresentation(image) attributes:nil];
}


@end
