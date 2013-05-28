//
//  StoryObject.m
//  avocarrotsdk
//
//  Created by Ajeet Singh on 27/05/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import "StoryObject.h"

@implementation StoryObject

@synthesize serialVersionUID;
@synthesize mObjectName;

@synthesize mObjectProperties;

-(id)init
{
    self=[super init];
	if (self)
	{
		self.serialVersionUID=SERIALVERSIONUID;
        self.mObjectName=@"";
        self.mObjectProperties=[[NSMutableDictionary alloc]init];
		
	}
	return self;
}


-(id)initWithObjectName :(NSString *)ObjectName
{
    self=[super init];
	if (self)
	{
		self.serialVersionUID=SERIALVERSIONUID;
        self.mObjectName=ObjectName;
        self.mObjectProperties=[[NSMutableDictionary alloc]init];
		
	}
	return self;
}

-(void)addProperty:(NSString*)key valueInt:(NSInteger)val
{
    [self.mObjectProperties setValue:[@""stringByAppendingFormat:@"%d",val] forKey:key];
}
-(void)addProperty:(NSString*)key valueBool:(Boolean)val
{
    [self.mObjectProperties setValue:[@""stringByAppendingFormat:@"%d",val] forKey:key];
}
-(void)addProperty:(NSString*)key valueFloat:(CGFloat)val
{
    [self.mObjectProperties setValue:[@""stringByAppendingFormat:@"%f",val] forKey:key];
}
-(void)addProperty:(NSString*)key valueDouble:(double)val
{
    [self.mObjectProperties setValue:[@""stringByAppendingFormat:@"%f",val] forKey:key];
}
-(void)addProperty:(NSString*)key valueString:(NSString*)val
{
    [self.mObjectProperties setValue:[@""stringByAppendingFormat:@"%@",val] forKey:key];
}

-(Boolean)hasProperties
{
    if(mObjectProperties==nil)
        return NO;
    else
        return YES;
}

-(NSDictionary*)toJSON
{
    NSDictionary *finalDic = [NSDictionary dictionaryWithObjectsAndKeys:mObjectName, @"name",mObjectProperties, @"properties",nil];
    
    
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:finalDic options:kNilOptions error:nil];
//    
//    NSString* datastring = [[NSString alloc] initWithData:jsonData
//                                                 encoding:NSUTF8StringEncoding] ;
    
    return  finalDic;
}

@end
