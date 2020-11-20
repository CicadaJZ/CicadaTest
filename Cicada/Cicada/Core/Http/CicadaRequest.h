//
//  CicadaRequest.h
//  Cicada
//
//  Created by 知了 on 2020/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CicadaRequest : NSObject

+ (instancetype)getInstance;

- (NSURLSessionDataTask *)get:(NSString *)URLString
                   parameters:(nullable id)parameters
                      headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                      success:(nullable void (^)(NSURLSessionDataTask * task, id _Nullable responseObject))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * error))failure;

- (NSURLSessionDataTask *)post:(NSString *)URLString
                    parameters:(nullable id)parameters
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * error))failure;

- (NSURLSessionDataTask *)upload:(NSString *)URLString
                      parameters:(nullable id)parameters
                         headers:(nullable NSDictionary<NSString *,NSString *> *)headers
//       constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData>))block
                        progress:(nullable void (^)(NSProgress *progress))progress
                         success:(nullable void (^)(NSURLSessionDataTask * task, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * error))failure;

- (NSURLSessionDataTask *)download:(NSString *)URLString
                        parameters:(nullable id)parameters
                           headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                          progress:(nullable void (^)(NSProgress *progress))progress
                           success:(nullable void (^)(NSURLSessionDataTask * task, id _Nullable responseObject))success
                           failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * error))failure;

@end

NS_ASSUME_NONNULL_END
