//
//  mbaBaseViewController.h
//  car
//
//  Created by Martin Bartusek on 04.06.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mbaTabBarController;

@interface mbaBaseViewController : UIViewController

@property (weak, nonatomic) mbaTabBarController *tabBarController;

- (void)update;

@end
