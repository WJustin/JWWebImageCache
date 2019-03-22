//
//  JWDownloadHandler.m
//  JWWebImageCache_Example
//
//  Created by Justin.wang on 2019/3/22.
//  Copyright © 2019年 Justin.wang. All rights reserved.
//

#import "YYWebImageDownloadHandler.h"
#import <YYWebImage/YYWebImage.h>

@implementation YYWebImageDownloadHandler

- (void)downloadWithUrl:(NSURL *)url completeHandler:(JWDownloadBlock)completeHandler {
    [[YYWebImageManager sharedManager] requestImageWithURL:url
                                                   options:0
                                                  progress:nil
                                                 transform:nil
                                                completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                                                    if (error) {
                                                        if (completeHandler) {
                                                            completeHandler(nil, error);
                                                        }
                                                    } else {
                                                        if (completeHandler) {
                                                            completeHandler(UIImageJPEGRepresentation(image, 0.9), nil);
                                                        }
                                                    }
                                                }];
}


@end
