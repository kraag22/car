//
//  mbaBaseView.h
//  car
//
//  Created by Martin Bartusek on 30.09.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mbaBaseView : UIView

@property (strong, nonatomic) UIButton *connectedBtn;

- (id)initWithCoder:(NSCoder *)aDecoder;

- (void)createConnectedBtn;

- (void)updateConnectedBtn:(BOOL)isConnected;

@end
