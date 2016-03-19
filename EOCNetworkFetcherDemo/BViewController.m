//
//  BViewController.m
//  EOCNetworkFetcherDemo
//
//  Created by SamingZhong on 16/3/19.
//  Copyright © 2016年 zhong. All rights reserved.
//

#import "BViewController.h"
#import "EOCNetworkFetcher.h"

@interface BViewController ()
@property (nonatomic, strong) NSData *fetchedData;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)fetchData:(id)sender {
    //[self downLoadData];
    NSURL *url = [NSURL URLWithString:@"https://www.apple.com"];
    EOCNetworkFetcher *networkFetcher = [[EOCNetworkFetcher alloc]initWithURL:url];
    [networkFetcher startWithCompletionHandler:^(NSData *data) {
        self.fetchedData = data;
        NSLog(@"url:%@", networkFetcher.url);
        NSLog(@"fetched data length:%ld", self.fetchedData.length);
    }];

}


- (void)downLoadData{
    NSURL *url = [NSURL URLWithString:@"https://www.apple.com"];
    EOCNetworkFetcher *networkFetcher = [[EOCNetworkFetcher alloc]initWithURL:url];
    [networkFetcher startWithCompletionHandler:^(NSData *data) {
        _fetchedData = data;
        NSLog(@"url:%@", networkFetcher.url);
        NSLog(@"fetched data length:%ld", self.fetchedData.length);
    }];
}

- (void)dealloc{
    NSLog(@"instance:%@ is deallocing...", self);
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
