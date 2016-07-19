//
//  WebVC.m
//  HengStars
//
//  Created by hengfu on 16/5/13.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "WebVC.h"
#import "UIColor+CreateImage.h"
#import <Webkit/WebKit.h>
@interface WebVC ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>
//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) WKWebView *webView;
@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavigationBar];
    if (self.titleText) {
       self.title = self.titleText;
    }
    
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    [wkUController addScriptMessageHandler:self name:@"webViewApp"];
    wkWebConfig.userContentController = wkUController;
    _webView.contentMode = UIViewContentModeScaleAspectFit;
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) configuration:wkWebConfig];

    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    
    
    
    [self.view addSubview:_webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"www.stars999.com"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


/**
 *  接收到服务器跳转请求之后调用
 *
 *  @param webView      实现该代理的webview
 *  @param navigation   当前navigation
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
    
}

//#pragma mark - WKScriptMessageHandlerDelegate
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
//
//    NSDictionary * dic =  message.body;
//    if ([[dic objectForKey:@"method"] isEqualToString:@"invest"]) {
//        [self jsToLicai:dic];
//        
//    }else if ([[dic objectForKey:@"method"] isEqualToString:@"home"]){
//        [self jsToHome:dic];
//    }else if ([[dic objectForKey:@"method"] isEqualToString:@"error"]){
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [UIInfomationView showAlertViewWithTitle:@"信息"
//                                             message:[dic objectForKey:@"param1"]
//                                   cancelButtonTitle:@"取消"
//                                   otherButtonTitles:@[@"确定"]
//                                        clickAtIndex:^(NSInteger buttonIndex){
//                                            if (buttonIndex == 1) {
//                                                [self jsToLicai:@{@"method":@"invest",@"param1":@"month"}];
//                                            }
//                                        }];
//            
//        });
//    }
}


@end
