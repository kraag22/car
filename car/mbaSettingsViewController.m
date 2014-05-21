//
//  mbaSecondViewController.m
//  car
//
//  Created by Martin Bartusek on 02.04.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaSettingsViewController.h"
#import "mbaSettingsView.h"

@interface mbaSettingsViewController ()

@end

@implementation mbaSettingsViewController


- (void)ipAddressFieldUpdated:(UITextField *)field {
    NSLog(@"%@", field.text);
    [[NSUserDefaults standardUserDefaults] setValue:field.text forKeyPath:@"ip_address"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ((mbaSettingsView *)self.view).controller = self;
    [(mbaSettingsView *)self.view renderIpAddressForm:[[NSUserDefaults standardUserDefaults] valueForKey:@"ip_address"]];
    
    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"ip_address"]) {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setTitle:NSLocalizedString(@"Chybí IP", nil)];
        [alert setMessage:NSLocalizedString(@"Není nastavena IP adresa zařízení. \n Vyplňte ji.", nil)];
        [alert setDelegate:self];
        [alert addButtonWithTitle:NSLocalizedString(@"OK", nil)];
        [alert show];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
