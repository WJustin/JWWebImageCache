//
//  JWWebImageCache.m
//  JWWebImageCache
//
//  Created by Justin.wang on 2019/3/22.
//

#import "JWWebImageCache.h"
#import <NSURLProtocolWebKitSupport/NSURLProtocol+HZWebKitSupport.h>

static NSString * const JWWebImageCacheProtocolKey = @"JWWebImageCacheProtocolKey";
static NSArray<NSString *> * JWSchemes;

static id<JWDownloadProtocol> Delegate;

@interface JWWebImageCache()

@end

@implementation JWWebImageCache

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JWSchemes = @[@"http", @"https"];
    });
}

+ (void)setupWithDelegate:(id<JWDownloadProtocol>)delegate {
    [JWSchemes enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [NSURLProtocol wk_registerScheme:obj];
    }];
    [NSURLProtocol registerClass:[JWWebImageCache class]];
    Delegate = delegate;
}

+ (void)unsetup {
    [JWSchemes enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [NSURLProtocol wk_unregisterScheme:obj];
    }];
    [NSURLProtocol unregisterClass:[JWWebImageCache class]];
    Delegate = nil;
}

#pragma mark - NSURLProtocol

- (instancetype)initWithRequest:(NSURLRequest *)request
                cachedResponse:(nullable NSCachedURLResponse *)cachedResponse
                        client:(nullable id <NSURLProtocolClient>)client {
    if (self = [super initWithRequest:request cachedResponse:cachedResponse client:client]) {
        
    }
    return self;
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    if ([request.URL.scheme hasPrefix:@"http"]) {
        NSString *str = request.URL.path;
        NSString *userAgent = [request valueForHTTPHeaderField:@"User-Agent"];
        if (([str containsString:@".png"] ||
             [str containsString:@".jpg"] ||
             [str containsString:@".jpeg"] ||
             [str containsString:@".webp"] ||
             [str containsString:@".gif"]) &&
            ![NSURLProtocol propertyForKey:JWWebImageCacheProtocolKey inRequest:request] &&
            ([userAgent containsString:@"AppleWebKit"])) {
            return YES;
        }
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    [NSURLProtocol setProperty:@YES
                        forKey:JWWebImageCacheProtocolKey
                     inRequest:mutableRequest];
    return mutableRequest;
}

- (void)startLoading {
    [Delegate downloadWithUrl:self.request.URL completeHandler:^(NSData * _Nonnull data, NSError * _Nonnull error) {
        if (error) {
            [self.client URLProtocol:self didFailWithError:error];
            [self.client URLProtocolDidFinishLoading:self];
        } else {
            [self.client URLProtocol:self didLoadData:data];
            [self.client URLProtocolDidFinishLoading:self];
        }
    }];
}

- (void)stopLoading {
    
}

@end
