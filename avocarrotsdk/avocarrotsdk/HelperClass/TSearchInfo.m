//
//  TSearchInfo.m
//  Plus
//
//  Created by Zhao Ling on 9/7/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

#import "TSearchInfo.h"

@implementation TSearchInfo

-(TSearchInfo *) initWithWebAPIName:(NSString *)apiName {
	m_paramMap = [[NSMutableDictionary alloc] init];
	m_webApiName = [[NSString alloc] initWithString:apiName];
	return self;
}

-(void) pushSearchField:(NSString *)field andValue:(NSString *)value {
	if (!m_paramMap) return;
	[m_paramMap setObject:value forKey:field];
}

-(NSString *) generateAsUrlParam {
	NSMutableString *param = [NSMutableString stringWithFormat:@"%@?", m_webApiName];
	NSArray *fields = [m_paramMap allKeys];
	
	if (fields.count == 0) return [param retain];
	for (NSString *field in fields) {
		NSString *value = [m_paramMap objectForKey:field];
		[param appendFormat:@"%@=%@&", field, value];
	}
	
	return [param substringToIndex:[param length] - 1];
}

-(NSString *) generateParam {
	NSMutableString *param = [[NSMutableString alloc] init];
	NSArray *fields = [m_paramMap allKeys];
	
	if (fields.count == 0) return [param retain];
	for (NSString *field in fields) {
		NSString *value = [m_paramMap objectForKey:field];
		[param appendFormat:@"%@=%@&", field, value];
	}
	
	return [param substringToIndex:[param length] - 1];
}

-(void) alloc {
	m_paramMap = nil;
	m_webApiName = nil;
}

-(void) dealloc {
	[super dealloc];
	if (m_paramMap) [m_paramMap release];
	if (m_webApiName) [m_webApiName release];
}
@end
