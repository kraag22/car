//
//  mbaBaseViewController.m
//  car
//
//  Created by Martin Bartusek on 04.06.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaBaseViewController.h"

#import "mbaTabBarController.h"
#import "mbaBaseView.h"

@interface mbaBaseViewController ()

@end

@implementation mbaBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.isConnected = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if ([((mbaBaseView *)self.view) connectedBtn] == nil) {
        [((mbaBaseView *)self.view) createConnectedBtn];
        [((mbaBaseView *)self.view) updateConnectedBtn:self.isConnected];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update {

}

- (void)connected:(BOOL) isConnected {
    self.isConnected = isConnected;
    
    [((mbaBaseView *)self.view) updateConnectedBtn:isConnected];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
