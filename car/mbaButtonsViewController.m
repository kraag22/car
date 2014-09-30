//
//  mbaButtonsViewController.m
//  car
//
//  Created by Martin Bartusek on 04.06.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaButtonsViewController.h"

#import "mbaTabBarController.h"
#import "mbaButtonsView.h"
#import "AFNetworking.h"

@interface mbaButtonsViewController ()

@end

@implementation mbaButtonsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)update {
    [super update];
    
    NSArray *buttons = [self.tabBarController.data objectForKey:@"buttons"];
    for (NSDictionary *button in buttons) {
        [((mbaButtonsView *)self.view) addButton:button];
    }
    
}

- (void)buttonStateChange:(id) sender {
    BOOL state = [sender isOn];
    NSString *rez = state == YES ? @"YES" : @"NO";
    
    NSLog(@"%@ - %li", rez, (long)[sender tag]);
    [self apiPostButtonState:state andId:[NSNumber numberWithInteger:[sender tag]]];
}

- (void)apiPostButtonState:(BOOL)state andId:(NSNumber *)buttonid {
    
    NSString *ipAddress = [[NSUserDefaults standardUserDefaults] valueForKey:@"ip_address"];
    ipAddress = [NSString stringWithFormat:@"http://%@:12570", ipAddress];
    NSLog(@"IP:%@", ipAddress);
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    
    NSMutableArray *params = [[NSMutableArray alloc] init];
    
    NSString *value;
    if (state) {
        value = @"1";
    }
    else {
        value = @"0";
    }

    [params addObject: @{@"id" :[buttonid stringValue], @"title": @"", @"value" : value }];
    
    
    [manager POST:ipAddress parameters:@{@"buttons": params}
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
