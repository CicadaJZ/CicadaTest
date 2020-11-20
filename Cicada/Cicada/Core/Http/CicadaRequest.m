//
//  CicadaRequest.m
//  Cicada
//
//  Created by 知了 on 2020/11/17.
//

#import "CicadaRequest.h"
#import <AFNetworking/AFNetworking.h>

@interface CicadaRequest ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end
@implementation CicadaRequest

+ (instancetype)getInstance {
    static CicadaRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        instance.manager = [[AFHTTPSessionManager alloc]init];
        
        instance.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        instance.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        instance.manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        instance.manager.requestSerializer.timeoutInterval = 30;
        [instance.manager.requestSerializer setValue:kAppShortVersion forHTTPHeaderField:@"VersionNum"];
        [instance.manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"AppType"];
        [instance.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"tpysign"];
        
        instance.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        instance.manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                           @"text/json",
                                                                                           @"text/javascript",
                                                                                           @"text/html",
                                                                                           @"text/plain" ,
                                                                                           @"application/octet-stream",
                                                                                           @"multipart/form-data",
                                                                                           @"application/x-www-form-urlencoded",
                                                                                           @"text/json",@"text/xml",
                                                                                           @"image/*"]];
        
        instance.manager.securityPolicy.allowInvalidCertificates = YES;
        instance.manager.securityPolicy.validatesDomainName = NO;
        
        instance.manager.operationQueue.maxConcurrentOperationCount = 5;
    });
    return instance;
}

- (NSURLSessionDataTask *)get:(NSString *)URLString
                   parameters:(nullable id)parameters
                      headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                      success:(nullable void (^)(NSURLSessionDataTask *, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    
    NSURLSessionDataTask *dataTask;

    dataTask = [_manager GET:URLString parameters:parameters headers:headers progress:nil success:^(NSURLSessionDataTask * task, id  _Nullable responseObject) {
        !success ? : success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * error) {
        !failure ? : failure(task, error);
    }];
    return dataTask;
}

- (NSURLSessionDataTask *)post:(NSString *)URLString
                    parameters:(nullable id)parameters
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask *, id _Nullable))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    
    NSURLSessionDataTask *dataTask;    

    dataTask = [_manager POST:URLString parameters:parameters headers:headers progress:nil success:^(NSURLSessionDataTask * task, id  _Nullable responseObject) {
        !success ? : success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * error) {
        !failure ? : failure(task, error);
    }];
    return dataTask;
}

- (NSURLSessionDataTask *)upload:(NSString *)URLString
                      parameters:(nullable id)parameters
                         headers:(nullable NSDictionary<NSString *,NSString *> *)headers
//       constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData>))block
                        progress:(nullable void (^)(NSProgress *))progress
                         success:(nullable void (^)(NSURLSessionDataTask *, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    NSURLSessionDataTask *dataTask;
    [_manager POST:URLString parameters:parameters headers:headers constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * uploadProgress) {
        !progress ? : progress(uploadProgress);
    } success:^(NSURLSessionDataTask * task, id  _Nullable responseObject) {
        !success ? : success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * error) {
        !failure ? : failure(task, error);
    }];
    return dataTask;
}

- (NSURLSessionDataTask *)download:(NSString *)URLString
                        parameters:(nullable id)parameters
                           headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                          progress:(nullable void (^)(NSProgress *))progress
                           success:(nullable void (^)(NSURLSessionDataTask *, id _Nullable))success
                           failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    
    NSURLSessionDataTask *dataTask;

    dataTask = [_manager GET:URLString parameters:parameters headers:headers progress:^(NSProgress * downloadProgress) {
        !progress ? : progress(downloadProgress);
    } success:^(NSURLSessionDataTask * task, id  _Nullable responseObject) {
        !success ? : success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * error) {
        !failure ? : failure(task, error);
    }];
    return dataTask;
}

@end
