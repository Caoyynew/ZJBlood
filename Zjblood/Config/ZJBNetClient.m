//
//  ZJBNetClient.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/27.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBNetClient.h"
#import "ZJBAFNManager.h"

@implementation ZJBNetClient
+(void)ZJBGetRequest:(NSString *)url params:(NSDictionary *)params success:(ZJBResponseSuccess)success fail:(ZJBResponseFail)fail
{
    [[ZJBAFNManager sharedClient] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dic = [ZJBNetClient responseConfiguration:responseObject];
        success(task,dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}

+(void)ZJBPostRequest:(NSString *)url params:(NSDictionary *)params success:(ZJBResponseSuccess)success fail:(ZJBResponseFail)fail
{
    [[ZJBAFNManager sharedClient]POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id dic = [ZJBNetClient responseConfiguration:responseObject];
        success(task,dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}

+(void)ZJBUploadWithURL:(NSString *)url params:(NSDictionary *)params fileData:(NSData *)filedata name:(NSString *)name fileName:(NSString *)filename mimeType:(NSString *)mimeType progress:(ZJBProgress)progress success:(ZJBResponseSuccess)success fail:(ZJBResponseFail)fail
{
    [[ZJBAFNManager sharedClient]POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:filedata name:name fileName:filename mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id dic = [ZJBNetClient responseConfiguration:responseObject];
        success(task, dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail (task,error);
    }];
}
+(NSURLSessionDownloadTask *)ZJBDownloadWithURL:(NSString *)url savePathURL:(NSURL *)fileURL progress:(ZJBProgress)progress success:(void (^)(NSURLResponse *, NSURL *))success fail:(void (^)(NSError *))fail
{
    NSURL *urlpath = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlpath];
    NSURLSessionDownloadTask * downtask = [[ZJBAFNManager sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [fileURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            fail(error);
        }else{
            success(response,filePath);
        }
    }];
    [downtask resume];
    
    return downtask;
}
#pragma mark 处理json格式的字符串中的换行符
+(id)responseConfiguration:(id)responseObject{
    
    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
}
@end

