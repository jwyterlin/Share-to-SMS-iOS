//
//  Alert.h
//  Share to SMS iOS
//
//  Created by Jhonathan Wyterlin on 03/11/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Alert : NSObject

-(UIAlertController *)showAlertTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController;

-(UIAlertController *)showAlertMessage:(NSString *)message viewController:(UIViewController *)viewController;

-(void)showError:(NSError *)error viewController:(UIViewController *)viewController;

-(void)showNoConnectionWithViewController:(UIViewController *)viewController;

@end
