//
//  AppDelegate.m
//  WeexDemo
//
//  Created by mnz on 17/3/13.
//  Copyright © 2017年 jianluo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WeexImageDownloader.h"
#import "WeexButton.h"
#import "WXPushComponent.h"
#import "WXEventModule.h"
#import "WXURLRewriteImpl.h"

#import <WeexSDK/WXSDKEngine.h>
#import <WeexSDK/WXDebugTool.h>
#import <WeexSDK/WXLog.h>
#import <WeexSDK/WXAppConfiguration.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //业务配置，非必需
    [WXAppConfiguration setAppGroup:@"AliApp"];
    [WXAppConfiguration setAppName:@"WeexDemo"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    //初始化SDK环境
    [WXSDKEngine initSDKEnvironment];
    //注册图片下载Handler
    [WXSDKEngine registerHandler:[WeexImageDownloader new] withProtocol:@protocol(WXImgLoaderProtocol)];
    //拦截所有加载url的Handler(image src加载本地图片)
    [WXSDKEngine registerHandler:[WXURLRewriteImpl new] withProtocol:@protocol(WXURLRewriteProtocol)];
    //注册自定义组件
    [WXSDKEngine registerComponent:@"weex-button" withClass:[WeexButton class]];
    [WXSDKEngine registerComponent:@"a" withClass:[WXPushComponent class]];
    
    //自定义模块
    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    
    //设置Log输出等级：调试环境默认为Debug，正式发布会自动关闭。
    [WXLog setLogLevel:WXLogLevelAll];
    
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
