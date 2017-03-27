//
//  ZJBAFNManager.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/27.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
//调试版本
#if IS_DEBUG
static NSString* const BASEURL = @"";
#else
static NSString* const BASEURL = @"";
#endif
@interface ZJBAFNManager : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
