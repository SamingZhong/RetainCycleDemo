//
//  ViewController.m
//  EOCNetworkFetcherDemo
//
//  Created by SamingZhong on 16/3/19.
//  Copyright © 2016年 zhong. All rights reserved.
//

#import "AViewController.h"
#import "EOCClass.h"

@interface AViewController ()
@property (nonatomic, strong) EOCClass *downLoader;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)downLoadData:(id)sender {
    self.downLoader = [EOCClass new];
    [self.downLoader downLoadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
