//
//  URLHeader.h
//  HengStars
//
//  Created by hengfu on 16/3/3.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#ifndef URLHeader_h
#define URLHeader_h
// 请求方法
#define kPostHttpMethod                     @"POST"
#define kGetHttpMethod                      @"GET"
#define SCREEN_HEIGHT                       ([UIScreen mainScreen].bounds.size.height)///<屏高
#define SCREEN_WIDTH                        ([UIScreen mainScreen].bounds.size.width)///<屏宽
//RGB宏
#define UIColorFromRGB(rgbValue)             [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]///<RGB转UIColor（不带alpha值

#define UIColorRGBAlpha(rgbValue,a)          [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]///<RGB转UIColor（带alpha值）
#define RGBAlpha(r, g, b, a)                [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]///<RGB
//环境地址
//#define KBaseUrl                            @"http://202.105.127.138:18193/ehf.app/hf/app/"//测试地址
#define WXBaseUrl                           @"http://202.105.127.138:18193/ehf.mobile.web/"//新闻测试基本地址
#define GWBaseUrl                           @"http://202.105.127.138:18193/ehf.mobile.web/"//分享测试基本地址
#define KBaseUrl                              @"https://m.hengfu100.com/hf/app/"//正式环境地址
//#define WXBaseUrl                             @"http://wx.hengfu100.com/"//新闻正式基本地址
//#define GWBaseUrl                           @"https://www.hengfu100.com/"//分享基本地址

//具体接口
//平台信息
#define KGetappbanner                       [NSString stringWithFormat:@"%@%@",KBaseUrl,@"getappbanner"]///<获取首页banner图
#endif /* URLHeader_h */
