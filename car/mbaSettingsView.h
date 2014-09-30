//
//  mbaSettingsView.h
//  car
//
//  Created by Martin Bartusek on 21.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mbaBaseView.h"

@class mbaSettingsViewController;

@interface mbaSettingsView : mbaBaseView

@property (strong, nonatomic) UITextField *ipAddressField;
@property (weak, nonatomic) mbaSettingsViewController *controller;

- (void)renderIpAddressForm:(NSString *)ipAddress;

@end
