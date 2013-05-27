//
//  ViewController.m
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "WebApiController.h"
#import "StoryObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnWithLook_clicked:(id)sender {
    

//    {"action":"buy",
//        "object":{"properties":{"price":10001111},"name":"Venue111"},
//        "user_hash":"41e29575c7361b2924f701502ca6d932b45b9e51"}

    
//    NSError *error;
//    
//    //build an info object and convert to json
//    NSDictionary *pricedic = [NSDictionary dictionaryWithObjectsAndKeys: @"1000", @"price", nil];
//    
//    NSDictionary *propertiesDic = [NSDictionary dictionaryWithObjectsAndKeys: pricedic, @"properties",@"Venue",@"name", nil];
//   
//    
//                                     
//                                     
        
    
    StoryObject *obj_Story=[[StoryObject alloc] initWithObjectName:@"Venue"];
    
    [obj_Story addProperty:@"price" valueInt:1000];
    
    
    NSDictionary *mainDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"buy",@"action",[obj_Story toJSON],@"object",(AppObj).strDeviceToken,@"user_hash",nil];
    
    
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:mainDatasetInfo options:kNilOptions error:nil];
    
    NSString* datastring = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding] ;

    
    WebApiController *obj=[[WebApiController alloc] init];
    
    
    [obj callAPIwithJSON_POST:[@"" stringByAppendingFormat:@"stories/?api_key=%@",APIKEY] json:datastring SuccessCallback:@selector(SuccessCallback_response:Response:) andDelegate:self];

 
    
}

- (IBAction)btnIFeelLucky_clicked:(id)sender {
    
    
    StoryObject *obj_Story=[[StoryObject alloc] initWithObjectName:@"Venue"];
    
    [obj_Story addProperty:@"price" valueInt:1000];
    
    
    NSDictionary *mainDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"buy",@"action",[obj_Story toJSON],@"object",(AppObj).strDeviceToken,@"user_hash",nil];
    
    
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:mainDatasetInfo options:kNilOptions error:nil];
    
    NSString* datastring = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding] ;
    
    
    WebApiController *obj=[[WebApiController alloc] init];
    
    
    [obj callAPIwithJSON_POST:[@"" stringByAppendingFormat:@"stories/?api_key=%@",APIKEY] json:datastring SuccessCallback:@selector(SuccessCallback_response1:Response:) andDelegate:self];
    
    
}

#pragma mark WithLook api
-(void)SuccessCallback_response:(NSString *)apiAlias Response:(NSData *)response
{
    [SVProgressHUD dismiss];
    ///apiAlias is name of api during calling
    
    ///response is actual value come from the server
    
    NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",jsonDictionary);
    
    if([[jsonDictionary objectForKey:@"enhancement"] isEqual:[NSNull null]])
    {
        NSLog(@"Enhancement is empty.");
    }
   
   
    
}



#pragma mark IFeelLucky api
-(void)SuccessCallback_response1:(NSString *)apiAlias Response:(NSData *)response
{
    [SVProgressHUD dismiss];
    ///apiAlias is name of api during calling
    
    ///response is actual value come from the server
    
    NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",jsonDictionary);
    
    if([[jsonDictionary objectForKey:@"enhancement"] isEqual:[NSNull null]])
    {
        NSLog(@"No Enhancement was triggered");
    }
    
    
    
}


@end
