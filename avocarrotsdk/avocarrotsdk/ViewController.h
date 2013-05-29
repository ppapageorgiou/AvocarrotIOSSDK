//
//  ViewController.h
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableData *m_data;
}
@property (retain, nonatomic) IBOutlet UITextField *txtEmail;

@property (retain, nonatomic) IBOutlet UIView *viewPopup;
- (IBAction)btnWithLook_clicked:(id)sender;
- (IBAction)btnIFeelLucky_clicked:(id)sender;
- (IBAction)btnPopup_clicked:(id)sender;
- (IBAction)btnClosepopup_clicked:(id)sender;
- (IBAction)btnRedeem_clicked:(id)sender;
@end
