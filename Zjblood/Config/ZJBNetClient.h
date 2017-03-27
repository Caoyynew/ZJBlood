//
//  ZJBNetClient.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/27.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

/**
 请求成功
 
 @param task 任务
 @param responseObject 请求成功返回的数据
 */
typedef void(^ZJBResponseSuccess)(NSURLSessionDataTask *task, id responseObject);

/**
 请求失败
 
 @param task 任务
 @param error 报错信息
 */
typedef void(^ZJBResponseFail)(NSURLSessionDataTask * task , NSError * error);

/**
 上传或下载进度
 
 @param progress 进度
 */
typedef void(^ZJBProgress)(NSProgress * progress);
@interface ZJBNetClient : NSObject

/**
 GET请求

 @param url 请求网络地址
 @param params 请求参数
 @param success 成功回调
 @param fail 失败回调
 */
+(void)ZJBGetRequest:(NSString *)url params:(NSDictionary *)params success:(ZJBResponseSuccess)success fail:(ZJBResponseFail)fail;

/**
 Post请求

 @param url 请求网络地址
 @param params 请求参数
 @param success 成功回调
 @param fail 失败回调
 */
+(void)ZJBPostRequest:(NSString *)url params:(NSDictionary *)params success:(ZJBResponseSuccess)success fail:(ZJBResponseFail)fail;

/**
 上传文件

 @param url 请求网址路径
 @param params 请求参数
 @param filedata 文件
 @param name 指定参数名
 @param filename 文件名（要有后缀名）
 @param mimeType 文件类型
 @param progress 上传进度
 @param success 成功回调
 @param fail 失败回调
 */
+(void)ZJBUploadWithURL:(NSString *)url  params:(NSDictionary *)params fileData:(NSData *)filedata
                   name:(NSString *)name
               fileName:(NSString *)filename
               mimeType:(NSString *) mimeType
               progress:(ZJBProgress)progress
                success:(ZJBResponseSuccess)success
                   fail:(ZJBResponseFail)fail;
/**
 *  下载文件
 *
 *  @param url      请求网络路径
 *  @param fileURL  保存文件url
 *  @param progress 下载进度
 *  @param success  成功回调
 *  @param fail     失败回调
 *
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，重新开启下载调用resume方法
 */
+(NSURLSessionDownloadTask *)ZJBDownloadWithURL:(NSString *)url
                                 savePathURL:(NSURL *)fileURL
                                    progress:(ZJBProgress )progress
                                     success:(void (^)(NSURLResponse *, NSURL *))success
                                        fail:(void (^)(NSError *))fail;
@end
