//
//  mbaButtonsView.m
//  car
//
//  Created by Martin Bartusek on 18.06.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaButtonsView.h"
#import "Masonry.h"
#import "mbaButtonsViewController.h"

@implementation mbaButtonsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)addButton:(NSDictionary *)button {
    if (self.lastView == nil) {
        self.lastView = self.headline;
    }
    
    if (self.buttons == nil) {
        self.buttons = [[NSMutableArray alloc] init];
    }
    
    if (button[@"show"] && button[@"show"] == false) {
        return;
        // NOTREACHED
    }
    UISwitch *uiSwitch = [self getButton:button[@"id"]];
//    NSString *text = [NSString stringWithFormat:@"%@ - %@ %@", button[@"title"], button[@"value"] , button[@"unit"]];
    
    if (uiSwitch != nil) {
//        [uiButton setText:text];
    }
    else {
        UISwitch *uiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [uiSwitch addTarget:self.controller action:@selector(buttonStateChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:uiSwitch];
        
        uiSwitch.tag  = [button[@"id"] intValue];
        
        [self addSubview:uiSwitch];
        
        [uiSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@400);
            make.width.greaterThanOrEqualTo(@200);
            make.height.equalTo(@60.0);
            make.top.equalTo(self.lastView.mas_top).with.offset(50.0f);
            make.centerX.equalTo(self.lastView.mas_centerX);
            
            self.lastView = uiSwitch;
        }];

        [self.buttons addObject:uiSwitch];
    }
    
    
}

- (UISwitch *)getButton:(NSNumber *)buttonId {
    for (UISwitch *button in self.buttons) {
        if (button.tag == [buttonId intValue]) {
            return button;
        }
    }
    return nil;
}

@end
