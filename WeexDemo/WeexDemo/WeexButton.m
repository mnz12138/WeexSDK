//
//  WeexButton.m
//  WeexDemo
//
//  Created by mnz on 17/3/14.
//  Copyright © 2017年 jianluo. All rights reserved.
//

#import "WeexButton.h"

@interface WeexButton ()

@property(nonatomic, strong) UIButton *innerButton;

@end

@implementation WeexButton

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance {
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        _title = [WXConvert NSString:attributes[@"title"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.innerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.innerButton.frame = self.view.bounds;
    [self.view addSubview:self.innerButton];
    [self.innerButton setTitle:self.title forState:UIControlStateNormal];
    [self.innerButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onButtonClick:(UIButton *)btn {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"哈哈哈哈" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alertView show];
}

@end
