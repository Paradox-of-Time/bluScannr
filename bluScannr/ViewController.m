//
//  ViewController.m
//  bluScannr
//
//  Created by Digital Lab 4 on 1/26/16.
//  Copyright © 2016 Momentum. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)showButton:(id)sender
{
    appTitle.hidden = NO;
    hideButton.hidden = NO;
    showButton.hidden = YES;
}

- (IBAction)hideButton:(id)sender
{
    appTitle.hidden = YES;
    hideButton.hidden = YES;
    showButton.hidden = NO;
}

- (IBAction)openScannr:(id)sender
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"scannr://?callbackScheme=bluScanner"]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"scannr://?callbackScheme=bluScanner"]];
    } else {
        NSLog(@"Can't use Scannr");
    }
}

// obtain scanning result
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([sourceApplication isEqualToString:@"hr.infinum.photopay.scannr"]) {
        NSString *urlString = [url.absoluteString
                               stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *resultString = [urlString stringByReplacingOccurrencesOfString:@"bluScanner://"
                                                                      withString:@""];
        NSError *error = nil;
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:[resultString
                                                                            dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
        if (!error) {
            NSLog(@"RESULT OF SCANNING: %@", resultDict);
        } else {
            NSLog(@"ERROR: %@", error);
        }
        return YES;
    }
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    appTitle.hidden = YES;
    showButton.hidden = NO;
    hideButton.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
