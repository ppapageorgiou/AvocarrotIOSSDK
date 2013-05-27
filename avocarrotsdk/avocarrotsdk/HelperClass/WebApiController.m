//
//  WebApiController.m
//  Chirag Lukhi
//
//  Created by Lanetteam on 9/10/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

#import "WebApiController.h"

@interface WebApiController ()

@end

@implementation WebApiController

+ (Reachability *) checkServerConnection {
    return [Reachability reachabilityWithHostName:SERVERNAME];
}

- (void)callAPI_POST:(NSString *)apiName andParams:(NSDictionary *)params SuccessCallback:(SEL)successCallback andDelegate:delegateObj {
    TSearchInfo *searchInfo = [[TSearchInfo alloc] initWithWebAPIName:apiName];
    for (NSString *key in params) {
        NSString *value = [params objectForKey:key];
        //need Base-64????
        [searchInfo pushSearchField:key andValue:value];
    }
    
    NSString *alias_api=[[NSString alloc] initWithString:apiName];
    
    TWebApi *webApi = [[TWebApi alloc] initWithFullApiName:[searchInfo generateAsUrlParam] andAlias:alias_api];
    [webApi setMethodName:[SERVERNAME stringByAppendingFormat:@"%@",apiName ]];
    [webApi setParameter:[searchInfo generateParam]]; 
    [webApi runApiSuccessCallback:successCallback inDelegate:delegateObj];
}



- (void)callAPIWithImage:(NSString *)apiName WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter SuccessCallback:(SEL)successCallback andDelegate:delegateObj{
   
    NSString *alias_api=[[NSString alloc] initWithString:apiName];
    
    TWebApi *webApi = [[TWebApi alloc] initWithFullApiName:apiName andAlias:alias_api];
    [webApi setMethodName:[SERVERNAME stringByAppendingFormat:@"%@",apiName ]];
    [webApi ForImageUploding_runApiSuccessCallback:successCallback inDelegate:delegateObj WithImageParameter:Iparameter WithoutImageParameter:WIparameter];
}
- (void)callAPI_GET:(NSString *)apiName andParams:(NSDictionary *)params SuccessCallback:(SEL)successCallback andDelegate:delegateObj {
    TSearchInfo *searchInfo = [[TSearchInfo alloc] initWithWebAPIName:apiName];
    for (NSString *key in params) {
        NSString *value = [params objectForKey:key];
        //need Base-64????
        [searchInfo pushSearchField:key andValue:value];
    }
    
    NSString *alias_api=[[NSString alloc] initWithString:apiName];
    
    TWebApi *webApi = [[TWebApi alloc] initWithFullApiName:[SERVERNAME stringByAppendingFormat:@"%@",[searchInfo generateAsUrlParam]] andAlias:alias_api];
    [webApi setMethodName:[SERVERNAME stringByAppendingFormat:@"%@",apiName ]];
    [webApi setParameter:[searchInfo generateParam]];
    [webApi GET_runApiSuccessCallback:successCallback inDelegate:delegateObj];
 
}

//chirag
- (void)callAPIwithJSON_POST:(NSString *)apiName  json:(NSString *)json SuccessCallback:(SEL)successCallback andDelegate:delegateObj
{
    TWebApi *webApi = [[TWebApi alloc] init];
    [webApi setMethodName:[SERVERNAME stringByAppendingFormat:@"%@",apiName ]];
    [webApi setParameter:json];
    [webApi passJSONApiSuccessCallback:successCallback inDelegate:delegateObj];
}


@end
