//
//  ViewController.h
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Enhancement.h"

@interface ViewController : UIViewController
{
    NSMutableData *m_data;
}
@property (retain, nonatomic) IBOutlet UITextField *txtEmail;
@property (retain, nonatomic) IBOutlet UILabel *lblGiftTitle;
@property (retain, nonatomic) IBOutlet UIImageView *imgGift;
@property (retain, nonatomic) Enhancement   *obj_enhancement;

@property (retain, nonatomic) IBOutlet UIView *viewPopup;
- (IBAction)btnWithLook_clicked:(id)sender;
- (IBAction)btnIFeelLucky_clicked:(id)sender;
- (IBAction)btnPopup_clicked:(id)sender;
- (IBAction)btnClosepopup_clicked:(id)sender;
- (IBAction)btnRedeem_clicked:(id)sender;
@end
