//
//  Avocarrot.m
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import "Avocarrot.h"

@implementation Avocarrot

@synthesize apiKey;

static int POPUP = 1;
static int  POPUP_WITH_DISMISS_HOOK = 2;
static int DEEP_INTEGRATION = 3;


-(id)initWithAPIKey :(NSString *)APIKey
{
	self=[super init];
	if (self)
	{
		self.apiKey=APIKey;
		
	}
	return self;
}

@end
