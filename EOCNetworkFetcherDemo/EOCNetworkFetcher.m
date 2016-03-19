//
//  EOCNetworkFetcher.m
//  EOCNetworkFetcherDemo
//
//  Created by SamingZhong on 16/3/19.
//  Copyright © 2016年 zhong. All rights reserved.
//

#import "EOCNetworkFetcher.h"

@interface EOCNetworkFetcher ()
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) EOCNetworkFetcherCompletionHandler completionHandler;
@property (nonatomic, strong) NSData *requestData;
@end
@implementation EOCNetworkFetcher

- (instancetype)initWithURL:(NSURL *)url{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;

}

- (void) startWithCompletionHandler:(EOCNetworkFetcherCompletionHandler)completion{
    self.completionHandler = completion;
    
    //doing some network download work...
    //self.requestData
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //[self p_requestCompleted];
    //});
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //
        NSLog(@"模拟异步请求耗时2s...");
        self.requestData = [NSData dataWithContentsOfURL:_url];
        sleep(2);
        [self p_requestCompleted];
    });
}

- (void) p_requestCompleted{
    _completionHandler?_completionHandler(_requestData):nil;
    self.completionHandler = nil;
}

- (void)dealloc{
    NSLog(@"instance(%@) is deallocing...", self);
}

@end
