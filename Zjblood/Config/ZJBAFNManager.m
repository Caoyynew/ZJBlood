//
//  ZJBAFNManager.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/27.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBAFNManager.h"

@implementation ZJBAFNManager

+(instancetype)sharedClient
{
    static ZJBAFNManager * _shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[ZJBAFNManager alloc]initWithBaseURL:[NSURL URLWithString:BASEURL]];
        _shareClient.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
        ((AFJSONResponseSerializer *)_shareClient.responseSerializer).removesKeysWithNullValues =YES;
        //证书相关
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        _shareClient.securityPolicy = securityPolicy;
        //超时时间
        _shareClient.requestSerializer.timeoutInterval =20;
        // 设置返回格式
        _shareClient.responseSerializer = [AFHTTPResponseSerializer serializer];

    });
    return _shareClient;
}

@end
