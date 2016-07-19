//
//  LoginViewController.m
//  HengStars
//
//  Created by hengfu on 16/3/15.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "LoginViewController.h"
#import "UMCommunity.h"
@interface LoginViewController ()
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UITextField *name;
@property(nonatomic,strong)UITextField *usid;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义登陆页面";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.name];
    [self.view addSubview:self.usid];
    
}
-(UIButton *)btn
{
    if (_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btn setTitle:@"进入社区" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor grayColor];
        _btn.frame = CGRectMake(10, 200, 100, 30);
        //_btn.center = self.view.center;
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

-(UITextField *)name
{
    if (_name == nil) {
        _name = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 150, 30)];
        _name.placeholder = @"姓名";
        _name.text = @"";
        _name.backgroundColor = [UIColor grayColor];
    }
    return _name;

}

-(UITextField*)usid
{
    if (_usid == nil) {
        _usid = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, 150, 30)];
        _usid.placeholder = @"usid";
        _usid.text = @"";
        _usid.backgroundColor = [UIColor grayColor];
    }
    return _usid;
}
-(void)btnAction:(id)btn
{
    NSLog(@"登陆");
    UMComUserAccount *userAccount = [[UMComUserAccount alloc] initWithSnsType:UMComSnsTypeSelfAccount];     //使用UMComSnsTypeSelfAccount代表自定义登录，该枚举类型必须和安卓SDK保持一致，否则会出现不能对应同一用户的问题
    userAccount.usid = self.usid.text.length==0? @"用户id":self.usid.text;//必填
    userAccount.name =  self.name.text.length==0? @"呢称":self.name.text;;//必填
    userAccount.icon_url = @"http://owhat.qiniudn.com/uploads/event/cover1/3050/f36e24875b193920795eb5bdf4f72021d2e9c42d?e=1457323058&token=_-9ZDkXlB9B7WGm1UUeyuPxLKLNCW7wofXwAkJTT:0hpZBDB5OUNXQikmI5vKq63EDwY="; //登录用户头像
    // 将数据传递给友盟微社区SDK
    [UMComLoginManager loginWithLoginViewController:self userAccount:userAccount];//self表示当前登录页面
}

@end
