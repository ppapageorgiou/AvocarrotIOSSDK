//
//  Enhancement.m
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import "Enhancement.h"

@implementation Enhancement
@synthesize mStatusCode;
@synthesize mEnhancementType;
@synthesize enhancementid;
@synthesize provider;
@synthesize headline;
@synthesize image;
@synthesize campaign;
@synthesize resourceUri;


-(Boolean)isEmpty
{
    if(mStatusCode==0)
        return YES;
    else
        return NO;
}

@end
