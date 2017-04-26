## Welcome to GitHub Pages

Weex是一套简单易用的跨平台开发方案，能以web的开发体验构建高性能，可扩展的本机应用，为了做到这些，Weex与Vue合作，使用Vue作为上层框架，并遵循W3C标准实现了统一的JSEngine和DOM API，这样一来，你甚至可以使用其他框架驱动Weex，打造三端一致的native应用程序。

### 搭建开发环境
点击->[链接](http://weex.apache.org/cn/guide/set-up-env.html)

### 集成到iOS

#### 通过cocoaPods集成Weex iOS SDK到您的项目
第一步：添加依赖
WeexSDK在cocoaPods上最新版本可以在[这](https://cocoapods.org/pods/WeexSDK)获取

第二步：安装依赖
打开命令行，切换到你已有项目Podfile这个文件存在的目录，执行pod install，没有出现任何错误表示已经完成环境配置。

第三步：初始化Weex环境
在AppDelegate.m文件中做初始化操作，一般会在didFinishLaunchingWithOptions方法中如下添加。
//业务配置
[WXAppConfiguration setAppGroup：@“AliApp”];
[WXAppConfiguration setAppName：@“WeexDemo”];
[WXAppConfiguration setAppVersion：@“1.0.0”];
// init sdk环境   
[WXSDKEngine initSDKEnviroment];
//注册自定义模块和组件，可选
[WXSDKEngine registerComponent：@“MyView”withClass：[MyViewComponent class]];
[WXSDKEngine registerModule：@“event”withClass：[WXEventModule class]];
//注册协议的实现，可选
[WXSDKEngine registerHandler：[WXNavigationDefaultImpl new] withProtocol：@protocol（WXNavigationProtocol）];
//设置日志级别    
[WXLog setLogLevel：WXLogLevelAll];


