//
//  WeexButton.h
//  WeexDemo
//
//  Created by mnz on 17/3/14.
//  Copyright © 2017年 jianluo. All rights reserved.
//

#import <WeexSDK/WeexSDK.h>

/**
 如果Weex的内置标签不足以满足要求时，我们可以自定义Native组件，然后暴露给.we文件使用
 <weex-button class="button" title="hello"></weex-button>
 */
@interface WeexButton : WXComponent

@property(nonatomic, copy) NSString *title;

@end
