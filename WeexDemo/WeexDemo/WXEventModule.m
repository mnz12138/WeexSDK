//
//  WXEventModule.m
//  WeexDemo
//
//  Created by mnz on 2017/4/25.
//  Copyright © 2017年 jianluo. All rights reserved.
//

#import "WXEventModule.h"
#import "WeexShowcaseViewController.h"

@implementation WXEventModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(openURL:callback:))
//同步返回值(暴露的同步方法只能在 JS 线程执行，请不要做太多同步的工作导致JS执行阻塞。)
WX_EXPORT_METHOD_SYNC(@selector(getString))

- (void)openURL:(NSString *)url callback:(WXModuleCallback)callback
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    UIViewController *controller = [[WeexShowcaseViewController alloc] init];
    ((WeexShowcaseViewController *)controller).weexUri = [NSURL URLWithString:newURL];
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
    callback(@{@"result":@"success"});
}

- (NSString *)getString
{
    return @"testString";
}


@end
