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
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://registry.npmjs.us/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSLog(@"%@", dict);

    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        
        
    }];
    
    [operation start];
}

@end
