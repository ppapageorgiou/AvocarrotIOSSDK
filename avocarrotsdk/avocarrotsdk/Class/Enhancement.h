//
//  Enhancement.h
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enhancement : NSObject

@property (nonatomic,assign) NSInteger mStatusCode;
@property (nonatomic,retain) NSString *mEnhancementType;
@property (nonatomic,retain) NSString *enhancementid;
@property (nonatomic,retain) NSString *provider;
@property (nonatomic,retain) NSString *headline;
@property (nonatomic,retain) NSString *image;




-(Boolean)isEmpty;

@end
