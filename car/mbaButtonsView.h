//
//  mbaButtonsView.h
//  car
//
//  Created by Martin Bartusek on 18.06.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mbaButtonsViewController;

@interface mbaButtonsView : UIView

@property (weak, nonatomic) IBOutlet UILabel *headline;

@property (weak, nonatomic)   mbaButtonsViewController *controller;
@property (weak, nonatomic)   UIView *lastView;
@property (nonatomic)         float topPadding;
@property (nonatomic)         float btnHeight;
@property (strong, nonatomic) NSMutableArray *buttons;

- (void)addButton:(NSDictionary *)button;

@end
