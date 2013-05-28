//
//  StoryObject.h
//  avocarrotsdk
//
//  Created by Ajeet Singh on 27/05/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryObject : NSObject

@property (nonatomic,retain) NSString *serialVersionUID;
@property (nonatomic,retain) NSString *mObjectName;

@property (nonatomic,retain) NSMutableDictionary  *mObjectProperties;


-(id)initWithObjectName :(NSString *)ObjectName;

-(void)addProperty:(NSString*)key valueInt:(NSInteger)val;
-(void)addProperty:(NSString*)key valueBool:(Boolean)val;
-(void)addProperty:(NSString*)key valueFloat:(CGFloat)val;
-(void)addProperty:(NSString*)key valueDouble:(double)val;
-(void)addProperty:(NSString*)key valueString:(NSString*)val;


-(NSDictionary*)toJSON;
-(Boolean)hasProperties;


@end
