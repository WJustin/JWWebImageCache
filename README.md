# JWWebImageCache

[![CI Status](https://img.shields.io/travis/Justin.wang/JWWebImageCache.svg?style=flat)](https://travis-ci.org/Justin.wang/JWWebImageCache)
[![Version](https://img.shields.io/cocoapods/v/JWWebImageCache.svg?style=flat)](https://cocoapods.org/pods/JWWebImageCache)
[![License](https://img.shields.io/cocoapods/l/JWWebImageCache.svg?style=flat)](https://cocoapods.org/pods/JWWebImageCache)
[![Platform](https://img.shields.io/cocoapods/p/JWWebImageCache.svg?style=flat)](https://cocoapods.org/pods/JWWebImageCache)

## Introduction

JWWebImageCache can share image cache between WKWebView and Native. And you can integrate image caching framework used in your project. For instance, YYWebImage or SDWebImage.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

JWWebImageCache is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JWWebImageCache', :git => 'https://github.com/WJustin/JWWebImageCache.git'
```
## Useage

 ### 1. Integrate image caching framework  
    if you use SDWebImage, you can copy the SDWebImageDownlodHandler class to your project.
    if you use YYWebImage, you can copy the YYWebImageDownloadHandler class to your project.
    
 ### 2. setup sdk
    for example: SDWebImage
    id <JWDownloadProtocol> handler = [[SDWebImageDownlodHandler alloc] init];
    [JWWebImageCache setupWithDelegate:handler];
 
## Author

Justin.wang, wangrongchao@126.com

## License

JWWebImageCache is available under the MIT license. See the LICENSE file for more info.
