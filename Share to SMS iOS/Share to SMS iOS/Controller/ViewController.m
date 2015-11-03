//
//  ViewController.m
//  Share to SMS iOS
//
//  Created by Jhonathan Wyterlin on 03/11/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ViewController.h"

#import <MessageUI/MessageUI.h>

// Util
#import "Alert.h"

@interface ViewController()<MFMessageComposeViewControllerDelegate>

@end

@implementation ViewController

#pragma mark - View Lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self sendSMS:@"This is a test"];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - MFMessageComposeViewControllerDelegate methods

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    switch (result) {
            
        case MessageComposeResultCancelled:
            break;
        case MessageComposeResultFailed: {
            
            [[Alert new] showAlertTitle:@"Error" message:@"Failed to send SMS!" viewController:self];
            break;
            
        }
            
        case MessageComposeResultSent:
            break;
        default:
            break;
            
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Private methods

-(void)sendSMS:(NSString *)text {
    
    if ( ! [MFMessageComposeViewController canSendText] ) {
        
        [[Alert new] showAlertTitle:@"Error" message:@"Your device doesn't support SMS!" viewController:self];
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

@end
