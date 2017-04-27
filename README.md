## Weex

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

第四步：呈染weex实例  
Weex支持整体页面渲染和部分渲染两种模式，你需要做的事情是用指定的URL渲染Weex的视图，然后添加到它的父容器上，父容器一般都是viewController

   #import <WeexSDK / WXSDKInstance.h>
    -（void）viewDidLoad 
    {
        [super viewDidLoad];
        _instance = [[WXSDKInstance alloc] init];
        _instance.viewController = self;
        _instance.frame = self.view.frame; 
        __weak typeof（self）weakSelf = self;
        _instance.onCreate = ^（UIView * view）{
            [weakSelf.weexView removeFromSuperview];
            [weakSelf.view addSubview：weakSelf.weexView];
        };
        _instance.onFailed = ^（NSError * error）{
            //进程失败
        };
        _instance.renderFinish = ^（UIView * view）{
            // process renderFinish
        };
        NSURL * url = [[NSBundle mainBundle] URLForResource：@“main”withExtension：@“js”]
        [_instance renderWithURL：url options：@ {@“bundleUrl”：[self.url absoluteString]} data：nil];
    }
    
WXSDKInstance是很重要的一个类，提供了基础的方法和一些回调，如renderWithURL，onCreate，onFailed等，参见可以WXSDKInstance.h的声明。  

第五步：销毁Weex实例  
在viewController的dealloc阶段销毁掉Weex实例，释放内存，避免造成内存泄露。

-（void）dealloc
{
    [_instance destroyInstance];
}


## 备注
使用weex-toolkit

### 安装
点>>>[我](http://weex.apache.org/cn/guide/tools/toolkit.html)吧！
