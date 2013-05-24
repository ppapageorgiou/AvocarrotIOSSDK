//
//  TXMLParser.h
//  Chirag Lukhi
//
//  Created by Lanetteam on 9/7/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

//call back style
// parseSuccessWithAlias:(NSString *)alias andResult:(NSDictionary *)result
// parseFailWithAlias:(NSString *)alias andError:(NSError *)err
#import <Foundation/Foundation.h>

@interface TXMLParser : NSObject <NSXMLParserDelegate>{
	NSString *m_xmlAlias;
	NSXMLParser *m_parser;
	NSMutableDictionary *m_parsedDict;
	
	NSObject *m_delegate;
	SEL m_successCallback;
	SEL m_failCallback;
	
	NSMutableString *m_currentString;

	NSMutableArray *m_currentPosition;
}

-(TXMLParser *)initWithAlias:(NSString *)xmlAlias;
-(void)parse:(NSData *)data successCallback:(SEL)successSelector failCallback:(SEL)failSelector inDelegate:(NSObject *)delegateObj;

@end
