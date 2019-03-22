//
//  JWWebImageCache.h
//  JWWebImageCache
//
//  Created by Justin.wang on 2019/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JWDownloadBlock)(NSData * _Nullable data, NSError * _Nullable error);

@protocol JWDownloadProtocol <NSObject>

- (void)downloadWithUrl:(NSURL *)url completeHandler:(JWDownloadBlock)completeHandler;

@end

@interface JWWebImageCache : NSURLProtocol

+ (void)setupWithDelegate:(id<JWDownloadProtocol>)delegate;
+ (void)unsetup;

@end

NS_ASSUME_NONNULL_END
