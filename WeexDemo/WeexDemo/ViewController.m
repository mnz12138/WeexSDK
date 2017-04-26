//
//  ViewController.m
//  WeexDemo
//
//  Created by mnz on 17/3/13.
//  Copyright © 2017年 jianluo. All rights reserved.
//

#import "ViewController.h"
#import "WeexShowcaseViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *filenameTF;

@property(nonatomic, strong) UIButton *innerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Weex";
}

- (IBAction)showWeex {
    NSString *str = [NSString stringWithFormat:@"http://localhost:8081/%@", self.filenameTF.text];
    WeexShowcaseViewController *vc = [WeexShowcaseViewController new];
    vc.weexUri = [NSURL URLWithString:str];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
