//
//  mbaTabBarController.m
//  car
//
//  Created by Martin Bartusek on 14.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaTabBarController.h"

#import "mbaBaseViewController.h"
#import "AFNetworking.h"

@interface mbaTabBarController ()

@end

@implementation mbaTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"ip_address"]) {
        self.selectedIndex = 0;
    }
    else {
        self.selectedIndex = 2;
    }
    
    for (mbaBaseViewController *controller in [self viewControllers]) {
        controller.tabBarController = self;
    }
    
    [self downloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)downloadData {
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
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.data = (NSDictionary *)responseObject;
        [self updateViews];
        NSLog(@"%@", self.data);
        [self performSelector:@selector(downloadData) withObject:nil afterDelay:[self getRefreshInterval]];
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
                                         [alert addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
                                         [alert addButtonWithTitle:NSLocalizedString(@"Try again", nil)];
                                         [alert show];
                                         
                                     }];
    
    [operation start];
}

- (float)getRefreshInterval {
    float interval = 5.0f;
    if (self.data && self.data[@"refresh"]) {
        interval = [self.data[@"refresh"] floatValue];
    }
    
    return interval;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        NSLog(@"download");
        [self downloadData];
    }
    
    
}

- (void)updateViews {
    for (mbaBaseViewController *controller in [self viewControllers]) {
        [controller update];
    }
}

@end
