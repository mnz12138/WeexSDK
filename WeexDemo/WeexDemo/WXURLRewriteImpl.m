//
//  WXURLRewriteImpl.m
//  Community
//
//  Created by 王全金 on 2017/4/28.
//  Copyright © 2017年 RongZi. All rights reserved.
//

#import "WXURLRewriteImpl.h"
#import <WeexSDK/WXLog.h>
#import <WeexSDK/WXSDKInstance.h>

@implementation WXURLRewriteImpl
static NSString * WXURLLocalScheme = @"local";

- (NSURL *)rewriteURL:(NSString *)url withResourceType:(WXResourceType)resourceType withInstance:(WXSDKInstance *)instance {
    NSURL *completeURL = [NSURL URLWithString:url];
    if ([completeURL isFileURL]) {
        return completeURL;
    } else if ([self isLocalURL:completeURL]) {
//        NSString *resourceName = [[completeURL host] stringByAppendingString:[completeURL path]];
//        NSURL *resourceURL = [[NSBundle mainBundle] URLForResource:resourceName withExtension:@""];
//        if (!resourceURL) {
//            WXLogError(@"Invalid local resource URL:%@, no resouce found.", url);
//        }
        NSRange range = [url rangeOfString:@"local:///"];
        NSString *resourceName = [url substringFromIndex:range.location+range.length];
        NSURL *resourceURL = [[NSBundle mainBundle] URLForResource:resourceName withExtension:@"png"];
        if (!resourceURL) {
            WXLogError(@"Invalid local resource URL:%@, no resouce found.", url);
        }
        return resourceURL;
    } else {
        return [instance completeURL:url];
    }
}

- (BOOL)isLocalURL:(NSURL *)url
{
    return[[[url scheme] lowercaseString] isEqualToString:WXURLLocalScheme];
}

@end
