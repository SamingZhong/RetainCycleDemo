//
//  EOCNetworkFetcher.h
//  EOCNetworkFetcherDemo
//
//  Created by SamingZhong on 16/3/19.
//  Copyright © 2016年 zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EOCNetworkFetcherCompletionHandler)(NSData *data);
@interface EOCNetworkFetcher : NSObject
@property (nonatomic, strong, readonly) NSURL *url;
- (instancetype) initWithURL:(NSURL *)url;
- (void)startWithCompletionHandler:(EOCNetworkFetcherCompletionHandler)completion;
@end
