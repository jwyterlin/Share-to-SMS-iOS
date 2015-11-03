//
//  ViewController.m
//  Share to SMS iOS
//
//  Created by Jhonathan Wyterlin on 03/11/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ViewController.h"

#import <MessageUI/MessageUI.h>

@interface ViewController()<MFMessageComposeViewControllerDelegate>

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)sendSMS:(NSString *)text {
    
    if ( ! [MFMessageComposeViewController canSendText] ) {
        
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                               message:@"Your device doesn't support SMS!"
                                                              delegate:nil
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
        [warningAlert show];
        
        return;
        
    }
    
    NSArray *recipents = @[@"32988290686"];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:text];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
    
}

#pragma mark - MFMessageComposeViewControllerDelegate methods

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {

    switch (result) {
            
        case MessageComposeResultCancelled:
            break;
        case MessageComposeResultFailed: {

            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:@"Failed to send SMS!"
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
            [warningAlert show];
            
            break;
            
        }
            
        case MessageComposeResultSent:
            break;
        default:
            break;
            
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
