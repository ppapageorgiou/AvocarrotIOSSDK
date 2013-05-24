//
//  TSearchInfo.h
//  Plus
//
//  Created by Zhao Ling on 9/7/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSearchInfo : NSObject {
	NSMutableDictionary *m_paramMap;
	NSString *m_webApiName;
}

-(TSearchInfo *) initWithWebAPIName:(NSString *)apiName;
-(void) pushSearchField:(NSString *)field andValue:(NSString *)value;
-(NSString *) generateAsUrlParam;
-(NSString *) generateParam;
@end
