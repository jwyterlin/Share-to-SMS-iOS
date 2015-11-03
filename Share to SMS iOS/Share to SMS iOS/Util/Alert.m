//
//  Alert.m
//  Share to SMS iOS
//
//  Created by Jhonathan Wyterlin on 03/11/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Alert.h"

@implementation Alert

-(UIAlertController *)showAlertTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   [viewController dismissViewControllerAnimated:YES completion:nil];
                                               }];
    
    [alert addAction:ok];
    
    [viewController presentViewController:alert animated:YES completion:nil];
    
    return alert;
    
}

-(UIAlertController *)showAlertMessage:(NSString *)message viewController:(UIViewController *)viewController {
    return [self showAlertTitle:nil message:message viewController:viewController];
}

-(void)showError:(NSError *)error viewController:(UIViewController *)viewController {
    
    NSString *message = [NSString stringWithFormat:@"An error has occurred: %@\n\nFeel free to inform us about it via e-mail contact@mail.com.br.",error.localizedDescription];
    
    [self showAlertMessage:message viewController:viewController];
    
}

-(void)showNoConnectionWithViewController:(UIViewController *)viewController {
    [self showAlertMessage:@"No connection with internet" viewController:viewController];
}

@end
