//
//  JWSDWebImageHandler.m
//  JWWebImageCache_Example
//
//  Created by Justin.wang on 2019/3/22.
//  Copyright © 2019年 Justin.wang. All rights reserved.
//

#import "SDWebImageDownlodHandler.h"
#import <SDWebImage/SDWebImageManager.h>

@implementation SDWebImageDownlodHandler

- (void)downloadWithUrl:(NSURL *)url completeHandler:(JWDownloadBlock)completeHandler {
    [[SDWebImageManager sharedManager] loadImageWithURL:url
                                             options:0
                                            progress:nil
                                           completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if (error) {
            if (completeHandler) {
                completeHandler(nil, error);
            }
        } else {
            if (completeHandler) {
                completeHandler(data, nil);
            }
        }
    }];
}


@end
