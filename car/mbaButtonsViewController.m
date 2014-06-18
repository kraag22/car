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
    
    NSLog(@"%@ - %i", rez, [sender tag]);
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
