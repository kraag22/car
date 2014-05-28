//
//  mbaFirstViewController.m
//  car
//
//  Created by Martin Bartusek on 02.04.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaFirstViewController.h"
#import "AFNetworking.h"


@interface mbaFirstViewController ()

@end

@implementation mbaFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    NSString *ipAddress = [[NSUserDefaults standardUserDefaults] valueForKey:@"ip_address"];
    ipAddress = [NSString stringWithFormat:@"http://%@:12570", ipAddress];
    NSLog(@"IP:%@", ipAddress);
    
    NSURL *url = [[NSURL alloc] initWithString:ipAddress];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"GetJSON" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:2.0f];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSLog(@"%@", dict);

    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString *errorDescription = @"Uknown error";
        
        if ([error.userInfo valueForKey:@"NSLocalizedDescription"]) {
            errorDescription = [error.userInfo valueForKey:@"NSLocalizedDescription"];
        }
        
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setTitle:NSLocalizedString(@"Connection error", nil)];
        [alert setMessage:errorDescription];
        [alert setDelegate:self];
        [alert addButtonWithTitle:NSLocalizedString(@"OK", nil)];
        [alert show];
        
    }];
    
    [operation start];
}

@end
