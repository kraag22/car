//
//  mbaTabBarController.m
//  car
//
//  Created by Martin Bartusek on 14.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaTabBarController.h"

#import "mbaBaseViewController.h"

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end