//
//  mbaFirstViewController.m
//  car
//
//  Created by Martin Bartusek on 02.04.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaLabelsViewController.h"
#import "mbaLabelsView.h"
#import "mbaTabBarController.h"

@interface mbaLabelsViewController ()

@end

@implementation mbaLabelsViewController

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
    
    
    NSArray *labels = [self.tabBarController.data objectForKey:@"labels"];
    for (NSDictionary *label in labels) {
        [((mbaLabelsView *)self.view) addLabel:label];
    }

}

@end
