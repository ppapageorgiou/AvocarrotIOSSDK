//
//  TWebApi.m
//  Chirag Lukhi
//
//  Created by Lanetteam on 9/7/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

#import "TWebApi.h"
#import "Reachability.h"

@implementation TWebApi
@synthesize MethodName,Parameter;
-(TWebApi *) initWithFullApiName:(NSString *)fullApiName andAlias:(NSString *)apiAlias {
	NSString *_apiAlias;
	NSString *_fullApiName;
	
	//nil safe
	if (apiAlias) _apiAlias = apiAlias;
	else _apiAlias = @"";
	
	if (fullApiName) _fullApiName = fullApiName;
    else _fullApiName = @"";
	
	m_apiAlias = [[NSString alloc] initWithString:_apiAlias];
	m_fullApiName = [[NSString alloc] initWithString:_fullApiName];

//   appDel= [[UIApplication sharedApplication] delegate];
    
	return self;
}

-(void)passJSONApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj {
    @try {
        
        NSLog(@"WEBAPI: Running web api: %@", MethodName);
        if (m_data) {
            [m_data release]; m_data = nil;
        }
        NSLog(@"%@ %@",Parameter,MethodName);
        
        
        
        
        NSURL *_url = [NSURL URLWithString:[MethodName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSLog(@"%@",_url);
        
        
        
        NSMutableURLRequest *_request = [[NSMutableURLRequest alloc] init];
        [_request setURL:[NSURL URLWithString:@"http://dev.avocarrot.com/api/v1/stories/?api_key=680bd81b98b905e71b102883289c1bab848fd918"]];
        [_request setHTTPMethod:@"POST"];
        [_request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_request setHTTPBody:[Parameter dataUsingEncoding:NSUTF8StringEncoding]];

        
        
//        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
//        [_request setTimeoutInterval:239];
//        // [_request addValue:@"text/plain; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//        [_request addValue:[[NSString alloc] initWithFormat:@"%d",[Parameter length]] forHTTPHeaderField:@"Content-length"];
//        [_request setHTTPMethod:@"POST"];
//        [_request setHTTPBody:[Parameter dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        // Web Service Logic
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            [respData setObject:@"No Network Found!" forKey:@"data"];
            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
            
            [self msgInternetAvaible];
            
            
            //            [delegateObj performSelector:failSelector withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_con = [NSURLConnection connectionWithRequest:_request delegate:self];
            
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            //            m_errorCallback = errorSelector;
            //            m_failCallback = failSelector;
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR IN runApiSuccessCallback WEBAPI");
    }
    @finally {
    }
    
}
-(void)runApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj {
    @try {
        
        NSLog(@"WEBAPI: Running web api: %@", MethodName);
        if (m_data) {
            [m_data release]; m_data = nil;
        }
        NSLog(@"%@ %@",Parameter,MethodName);
        
        
        
        
        NSURL *_url = [NSURL URLWithString:[MethodName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
         NSLog(@"%@",_url);
        
        
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:239];
        // [_request addValue:@"text/plain; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [_request addValue:[[NSString alloc] initWithFormat:@"%d",[Parameter length]] forHTTPHeaderField:@"Content-length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:[Parameter dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        // Web Service Logic
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            [respData setObject:@"No Network Found!" forKey:@"data"];
            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
            
             [self msgInternetAvaible];
            
            
//            [delegateObj performSelector:failSelector withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_con = [NSURLConnection connectionWithRequest:_request delegate:self];
            
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
//            m_errorCallback = errorSelector;
//            m_failCallback = failSelector;
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR IN runApiSuccessCallback WEBAPI");
    }
    @finally {
    }

}
-(void)GET_runApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj {
	
    @try {
        
        NSLog(@"WEBAPI: Running web api: %@  %@ %@", MethodName,m_fullApiName,m_apiAlias);
        if (m_data) {
            [m_data release]; m_data = nil;
        }
        
        
        
        
        
        NSURL *_url = [NSURL URLWithString:[m_fullApiName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
     
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
        
        [_request setTimeoutInterval:239];
        [_request setHTTPMethod:@"GET"];
        
        
         NSLog(@"%@",_url);
        
        // Web Service Logic
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            [respData setObject:@"No Network Found!" forKey:@"data"];
            
            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
            
             [self msgInternetAvaible];
            
            
//            [delegateObj performSelector:failSelector withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_con = [NSURLConnection connectionWithRequest:_request delegate:self];
            
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
//            m_errorCallback = errorSelector;
//            m_failCallback = failSelector;
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR IN GET_runApiSuccessCallback WEBAPI");
    }
    @finally {
    }
}


-(void)ForImageUploding_runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter{
	
    @try {
        
        NSLog(@"WEBAPI: Running web api: %@", MethodName);
        if (m_data) {
            [m_data release]; m_data = nil;
        }
        
        
        NSURL *_url = [NSURL URLWithString:MethodName];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:239];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [_request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        
        NSMutableData *body = [NSMutableData data];
        
        
       
        
        for (NSString *key in WIparameter) {
            NSString *value = [WIparameter objectForKey:key];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key, value] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
        }

        
        NSInteger i=0;
        for (NSString *key in Iparameter) {
            NSObject *value = [Iparameter objectForKey:key];
            
            //Image
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                 
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: file; name=\"%@\"; filename=\"image.png%d\"\r\n",key,i] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[NSData dataWithData:(NSData *)value]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            i++;
        }
        
         [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//       NSLog(@"%@",body);
        
        //[_request addValue:[[NSString alloc] initWithFormat:@"%d",[body length]] forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:body];
        
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            
            NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            [respData setObject:@"No Network Found!" forKey:@"data"];
            
            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
            [self msgInternetAvaible];
//            [delegateObj performSelector:m_failCallback withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_con = [NSURLConnection connectionWithRequest:_request delegate:self];
            
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
//            m_errorCallback = errorSelector;
//            m_failCallback = failSelector;
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR IN ForImageUploding_runApiSuccessCallback WEBAPI");
    }
    @finally {
    }
}

-(void)msgInternetAvaible
{
}

-(void) alloc {
	m_con = nil;
	m_successCallback = nil;
	m_failCallback = nil;
	m_apiAlias = nil;
	m_fullApiName = nil;
	m_delegate = nil;
	m_data = nil;
}

-(void) dealloc {
	if (m_con) [m_con release];
	if (m_apiAlias) [m_apiAlias release];
	if (m_fullApiName) [m_fullApiName release];
	if (m_data) [m_data release];
	[super dealloc];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    @try {
        NSHTTPURLResponse *httpResponse = nil;
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            httpResponse = (NSHTTPURLResponse *)response;
        }
        
        m_statusCode = [httpResponse statusCode];
        
        if ([httpResponse statusCode] == 1000) {
            m_error = NO;
        } else {
            m_error = YES;
        }

    }
    @catch (NSException *exception) {
        NSLog(@"Error in connection didReceiveResponse");
    }
    @finally {
        
    }
}

- (void)connection:(NSURLConnection *)theConnection	didReceiveData:(NSData *)incrementalData {
    @try {
        NSLog(@"WEBAPI: Received data.");
        [m_data appendData:incrementalData];
    }
    @catch (NSException *exception) {
        NSLog(@"Error in connection didReceiveData");
    }
    @finally {
    }
    
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	@try {
        NSLog(@"WEBAPI: Finished data loading.");
        if (!m_successCallback || !m_delegate) return;
        NSLog(@"WEBAPI: Calling success callback.");
        
        NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
        [respData setObject:[NSNumber numberWithInt:m_statusCode] forKey:@"code"];
        
        
        NSString* datastring = [[NSString alloc] initWithData:m_data
                                                     encoding:NSUTF8StringEncoding] ;
        
        
        [respData setObject:datastring forKey:@"data"];
        
        
        
        NSData* data = [[respData objectForKey:@"data"] dataUsingEncoding:NSUTF8StringEncoding];
        
        
        if (!m_error) {
            [m_delegate performSelector:m_successCallback withObject:m_apiAlias withObject:data];
        } else {
            [m_delegate performSelector:m_successCallback withObject:m_apiAlias withObject:data];
        }
    }
    @catch (NSException *exception) {
       NSLog(@"Error in connectionDidFinishLoading");
    }
    @finally {
       
    }
    
   
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    @try {
        
        NSLog(@"WEBAPI: Error occured. Errorcode:%@", [error localizedDescription]);
        if (!m_failCallback || !m_delegate) return;
//        [m_delegate performSelector:m_failCallback withObject:m_apiAlias withObject:error];
    }
    @catch (NSException *exception) {
     NSLog(@"Error in connection didFailWithError");
    }
    @finally {
        
    }
	
}
-(NSString *)checkNetworkConnectivity
{
    
    NSString *networkValue;
    
    Reachability *rc = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [rc currentReachabilityStatus];
    
	if(internetStatus==0)
	{
		networkValue = @"NoAccess";
	}
	else if(internetStatus==1)
	{
		networkValue = @"ReachableViaWiFi";
		
	} else if(internetStatus==2)
	{
		networkValue = @"ReachableViaWWAN";
	}
	else  if(internetStatus>2)
	{
		networkValue = @"Reachable";
	}
	
    return networkValue;
}


-(void)callNoNetworkAlert
{
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"No Network Found!" message:@"Please check your internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
	
}
@end
