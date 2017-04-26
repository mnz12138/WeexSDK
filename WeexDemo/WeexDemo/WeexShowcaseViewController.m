//
//  WeexShowcaseViewController.m
//  WeexDemo
//
//  Created by mnz on 17/3/14.
//  Copyright © 2017年 jianluo. All rights reserved.
//

#import "WeexShowcaseViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface WeexShowcaseViewController ()

@property (nonatomic, strong) WXSDKInstance *weexSDK;

@end

@implementation WeexShowcaseViewController

- (WXSDKInstance *)weexSDK {
    if (!_weexSDK) {
        _weexSDK = [WXSDKInstance new];
    }
    return _weexSDK;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize size = self.view.bounds.size;
    self.weexSDK.viewController = self;
    self.weexSDK.frame = CGRectMake(0, 64, size.width, size.height-64);
    
    [self.weexSDK renderWithURL:self.weexUri options:@{@"bundleUrl":self.weexUri.absoluteString} data:nil];
    
    __weak typeof(self) weakSelf = self;
    self.weexSDK.onCreate = ^(UIView *view) {
        [weakSelf.view addSubview:view];
    };
    
    //完成渲染
    self.weexSDK.renderFinish = ^(UIView *view) {
        
    };
    
    self.weexSDK.onFailed = ^(NSError *error) {
        NSLog(@"weexSDK onFailed : %@\n", error);
    };
}

- (void)dealloc {
    [_weexSDK destroyInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
