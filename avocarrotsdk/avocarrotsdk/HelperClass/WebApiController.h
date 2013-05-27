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


//#define StoryURL @"http://dev.avocarrot.com/api/v1/stories/?api_key="
//#define ClaimURL @"http://dev.avocarrot.com/api/v1/claims/?api_key="




@interface WebApiController : NSObject

+ (Reachability *) checkServerConnection;
- (void)callAPI_POST:(NSString *)apiName  andParams:(NSDictionary *)params SuccessCallback:(SEL)successCallback andDelegate:delegateObj ;

- (void)callAPIwithJSON_POST:(NSString *)apiName  json:(NSString *)json SuccessCallback:(SEL)successCallback andDelegate:delegateObj ;

- (void)callAPIWithImage:(NSString *)apiName WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter SuccessCallback:(SEL)successCallback andDelegate:delegateObj ;

- (void)callAPI_GET:(NSString *)apiName andParams:(NSDictionary *)params SuccessCallback:(SEL)successCallback andDelegate:delegateObj;

@end
