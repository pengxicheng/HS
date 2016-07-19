//
//  StoryDetailVC.m
//  HengStars
//
//  Created by hengfu on 16/5/13.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "StoryDetailVC.h"
#import "UIColor+CreateImage.h"
@interface StoryDetailVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation StoryDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavigationBar];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.stars999.com/"]] ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
