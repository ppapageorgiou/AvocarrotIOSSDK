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
@synthesize obj_enhancement;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *singleTapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapRecognizer)];
    singleTapGesture.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:singleTapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)singleTapRecognizer
{
    [UIView beginAnimations:@"SLowly" context:nil];
    [UIView setAnimationDuration:0.4];
    
    [self.txtEmail resignFirstResponder];
    
    CGRect r=self.viewPopup.frame;
    r.origin.y=0;
    self.viewPopup.frame=r;
    
    [UIView commitAnimations];
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
                                    
        
    
    StoryObject *obj_Story=[[StoryObject alloc] initWithObjectName:@"Venue"];
    
    [obj_Story addProperty:@"price" valueInt:1000];
    
    
    NSDictionary *mainDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"buy",@"action",[obj_Story toJSON],@"object",(AppObj).strDeviceToken,@"user_hash",nil];
    
    
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:mainDatasetInfo options:kNilOptions error:nil];
    
    NSString* datastring = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding] ;

    
    WebApiController *obj=[[WebApiController alloc] init];
    
    
    [obj callAPIwithJSON_POST:[@"" stringByAppendingFormat:@"stories/?api_key=%@",APIKEY] json:datastring SuccessCallback:@selector(SuccessCallback_response:Response:) andDelegate:self];

 
    [SVProgressHUD show];
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
    [SVProgressHUD show];
    
}

- (IBAction)btnPopup_clicked:(id)sender {
    
//    self.viewPopup.center=self.view.center;
    
    [self.view addSubview:self.viewPopup];
}

- (IBAction)btnClosepopup_clicked:(id)sender {
    [self.viewPopup removeFromSuperview];

}

- (IBAction)btnRedeem_clicked:(id)sender {
    
//
    
    if([self.txtEmail.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Avocarrot" message:@"Fill Email." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    
    [SVProgressHUD show];
    
    WebApiController *obj=[[WebApiController alloc] init];
    
//    NSDictionary *mainDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.txtEmail.text,@"email",obj_enhancement.resourceUri,@"reward",@"Anything",@"achievementReason",(AppObj).strDeviceToken==nil?@"324234234234234":(AppObj).strDeviceToken,@"user_hash",nil];

    
    NSDictionary *mainDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.txtEmail.text,@"email",obj_enhancement.resourceUri,@"reward",nil];
    
    
    
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:mainDatasetInfo options:kNilOptions error:nil];
    
    NSString* datastring = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding] ;
    NSLog(@"------%@",datastring);
    
    
    [obj callAPIwithJSON_POST:[@"" stringByAppendingFormat:@"claims/?api_key=%@",APIKEY] json:datastring SuccessCallback:@selector(SuccessCallback_response2:Response:) andDelegate:self];
    
}

-(void)openPopup
{
}

#pragma mark WithLook api
-(void)SuccessCallback_response:(NSString *)apiAlias Response:(NSData *)response
{
    [SVProgressHUD dismiss];
    ///apiAlias is name of api during calling
    
    ///response is actual value come from the server
    
    NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",jsonDictionary);
    
    NSDictionary *dic_enha=[jsonDictionary objectForKey:@"enhancement"];

    
    if([dic_enha isEqual:[NSNull null]])
    {
        NSLog(@"Enhancement is empty.");
    }
    else
    {//open pop up
        [self loadEnhancement:dic_enha];
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
      NSDictionary *dic_enha=[jsonDictionary objectForKey:@"enhancement"];
    
    if([dic_enha isEqual:[NSNull null]])
    {
        NSLog(@"No Enhancement was triggered");
    }
    else
    {//open popup
                
        [self loadEnhancement:dic_enha];
    }
    
    
    
}
-(void)loadEnhancement:(NSDictionary*)dic_enha
{
//    enhancement =     {
//        campaign = "/api/v1/campaigns/1/";
//        headline = "FREE $3 Amazon Gift Card!";
//        id = 1;
//        img = "http://dev.avocarrot.com/media/images/products/amazon_2.png";
//        providerName = Amazon;
//        resourceUri = "/api/v1/rewards/1/";
//    };
    
    obj_enhancement=[[Enhancement alloc] init];
    obj_enhancement.enhancementid=[dic_enha objectForKey:@"id"];
    obj_enhancement.campaign=[dic_enha objectForKey:@"campaign"];
    obj_enhancement.headline=[dic_enha objectForKey:@"headline"];
    obj_enhancement.image=[dic_enha objectForKey:@"img"];
    obj_enhancement.provider=[dic_enha objectForKey:@"providerName"];
    obj_enhancement.resourceUri=[dic_enha objectForKey:@"resourceUri"];

     [self.view addSubview:self.viewPopup];
    [self.imgGift setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:obj_enhancement.image]]]];
    [self.lblGiftTitle setText:obj_enhancement.headline];
}

#pragma mark Claim api
-(void)SuccessCallback_response2:(NSString *)apiAlias Response:(NSData *)response
{
    [SVProgressHUD dismiss];
    ///apiAlias is name of api during calling
    
    ///response is actual value come from the server
    
    NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",jsonDictionary);

    [self.txtEmail setText:@""];
    
    if([jsonDictionary objectForKey:@"error"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:[jsonDictionary objectForKey:@"error"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        [self btnClosepopup_clicked:nil];
    }
}

#pragma mark UITextField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [UIView beginAnimations:@"SLowly" context:nil];
    [UIView setAnimationDuration:0.4];
    
    CGRect r=self.viewPopup.frame;
    r.origin.y=r.origin.y-100;
    self.viewPopup.frame=r;

    [UIView commitAnimations];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
       
        [self singleTapRecognizer];
        
        return NO;
    }
    return YES;
}

- (void)dealloc {
    [_viewPopup release];
    [_txtEmail release];
    [_lblGiftTitle release];
    [_imgGift release];
    [super dealloc];
}

@end
