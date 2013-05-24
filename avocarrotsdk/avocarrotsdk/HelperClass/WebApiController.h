//
//  WebApiController.h
//  Chirag Lukhi
//
//  Created by Lanetteam on 9/9/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWebApi.h"
#import "Reachability.h"
#import "TSearchInfo.h"

#define SERVERNAME                     @"http://localhost/LACommon/"




@interface WebApiController : NSObject

+ (Reachability *) checkServerConnection;
- (void)callAPI_POST:(NSString *)apiName  andParams:(NSDictionary *)params SuccessCallback:(SEL)successCallback andDelegate:delegateObj ;

- (void)callAPIWithImage:(NSString *)apiName WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter SuccessCallback:(SEL)successCallback andDelegate:delegateObj ;

- (void)callAPI_GET:(NSString *)apiName andParams:(NSDictionary *)params SuccessCallback:(SEL)successCallback andDelegate:delegateObj;

@end
