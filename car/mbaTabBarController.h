//
//  mbaTabBarController.h
//  car
//
//  Created by Martin Bartusek on 14.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mbaTabBarController : UITabBarController

@property (strong, nonatomic) NSDictionary *data;
@property ( nonatomic) NSInteger connectionErrorNo;

@end
