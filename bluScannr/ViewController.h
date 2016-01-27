//
//  ViewController.h
//  bluScannr
//
//  Created by Digital Lab 4 on 1/26/16.
//  Copyright © 2016 Momentum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *appTitle;
    IBOutlet UIButton *showButton;
    IBOutlet UIButton *hideButton;
    IBOutlet UIButton *openScannr;
}

-(IBAction)showButton:(id)sender;
-(IBAction)hideButton:(id)sender;
-(IBAction)openScannr:(id)sender;

@end

