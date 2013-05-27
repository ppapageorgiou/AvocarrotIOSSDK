//
//  TWebApi.h
//  Chirag Lukhi
//
//  Created by Lanetteam on 9/7/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

//call back style
// webApiSuccessWithAlias:(NSString *)alias andData:(NSDictionary *)data
// webApiErrorWithAlias:(NSString *)alias andData:(NSDictionary *)data
// webApiFailWithAlias:(NSString *)alias andError:(NSError *)err
#import <Foundation/Foundation.h>

@interface TWebApi : NSObject <NSURLConnectionDataDelegate> {
	NSURLConnection *m_con;
	NSMutableData *m_data;
	
	NSString *m_apiAlias;
	NSString *m_fullApiName;
	NSObject *m_delegate;
	SEL m_successCallback;
    SEL m_errorCallback;
	SEL m_failCallback;
    
    BOOL m_error;
    BOOL m_statusCode;
    
    NSString *MethodName,*Parameter;
//    AppDelegate *appDel;

}
@property(nonatomic,retain) NSString *MethodName,*Parameter;
-(TWebApi *) initWithFullApiName:(NSString *)fullApiName andAlias:(NSString *)apiAlias;
-(void)runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj;
-(void)GET_runApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj;
-(void)ForImageUploding_runApiSuccessCallback:(SEL)successSelectorfailSelector inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter;


//chirag
-(void)passJSONApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj;


-(NSString *)checkNetworkConnectivity;
-(void)callNoNetworkAlert;
@end
