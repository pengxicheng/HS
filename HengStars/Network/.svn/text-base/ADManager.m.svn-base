//
//  ADManager.m
//  HengStars
//
//  Created by hengfu on 16/4/27.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "ADManager.h"

#define KCashedCurrentImage ([[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/adcurrent.png"])

#define KcasheNewImage ([[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/adnew.png"])

@interface ADManager()
+ (void)downloadImage:(NSString *)imageUrl;
@end
@implementation ADManager

//是否有图片
+ (BOOL)isShouldDisplayAd
{

    return ([[NSFileManager defaultManager] fileExistsAtPath:KCashedCurrentImage isDirectory:NULL] || [[NSFileManager defaultManager] fileExistsAtPath:KcasheNewImage isDirectory:NULL] ) ;
}

//获取最近的图片（有新图片就用新图片）
+ (UIImage *)getAdImage
{
    if([[NSFileManager defaultManager] fileExistsAtPath:KcasheNewImage isDirectory:NULL])
    {
        [[NSFileManager defaultManager] removeItemAtPath:KCashedCurrentImage error:nil];
    }
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:KCashedCurrentImage]];
}


+ (void)downloadImage:(NSString *)imageUrl
{
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:imageUrl]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            [data writeToFile:KCashedCurrentImage atomically:YES];
            NSLog(@"图片下载成功");
        }
    }];
    [task resume];
}

+ (void)loadLatestAdImage
{
    NSInteger now = [[[NSDate alloc] init] timeIntervalSince1970];
    NSString *path = [NSString stringWithFormat:@"http://g1.163.com/madr?app=7A16FBB6&platform=ios&category=startup&location=1&timestamp=%ld",(long)now];
    
    //
    AFHTTPSessionManager *aFHTTPSessionManager;
  
    NSURL *url = [NSURL URLWithString:@""];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    aFHTTPSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:config];
    
    aFHTTPSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    
    [aFHTTPSessionManager GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *adArray = [responseObject valueForKey:@"ads"];
        NSString *imgUrl = adArray[0][@"res_url"][0];
        NSString *imgUrl2 = nil;
        if (adArray.count > 1) {
            imgUrl2 = adArray[1][@"res_url"][0];
        }
        BOOL one = [[NSUserDefaults standardUserDefaults]boolForKey:@"one"];
        if (imgUrl2.length > 0) {
            if (one) {
                [self downloadImage:imgUrl];
                [[NSUserDefaults standardUserDefaults]setBool:!one forKey:@"one"];
            }else{
                [self downloadImage:imgUrl2];
                [[NSUserDefaults standardUserDefaults]setBool:!one forKey:@"one"];
            }
        }else{
            [self downloadImage:imgUrl];
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}
@end


