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

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.buttons = [[NSMutableArray alloc] init];
        self.topPadding = 0.0f;
        self.btnHeight = 40.0f;
    }
    return self;
}

- (void)addButton:(NSDictionary *)button {
    
    if (self.lastView == nil) {
        self.lastView = self.headline;
    }
    
    NSLog(@"%@", button[@"id"]);
    if ((button[@"show"] && [button[@"show"] boolValue] == false)) {
        self.topPadding += self.btnHeight;
        return;
        // NOTREACHED
    }
    
    UISwitch *uiSwitch = [self getButton:button[@"id"]];
    
    if (uiSwitch == nil) {
        // create title
        NSString *text = [NSString stringWithFormat:@"%@", button[@"title"]];
        UILabel *uiLabel = [[UILabel alloc] init];
        uiLabel.text = text;
        
        [self addSubview:uiLabel];
        
        // create switch
        UISwitch *uiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [uiSwitch addTarget:self.controller action:@selector(buttonStateChange:) forControlEvents:UIControlEventValueChanged];
        [uiSwitch setOn:[button[@"value"] boolValue] animated:YES];
        [self addSubview:uiSwitch];
        
        uiSwitch.tag  = [button[@"id"] intValue];
        
        [self addSubview:uiSwitch];
        
        [uiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@400);
            make.width.greaterThanOrEqualTo(@200);
            make.height.equalTo([NSNumber numberWithFloat:self.btnHeight]);
            make.top.equalTo(self.lastView.mas_top).with.offset(50.0f + self.topPadding);
            make.centerX.equalTo(self.headline.mas_centerX).with.offset(-50.0f);
            
            self.lastView = uiLabel;
        }];
        
        
        [uiSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@100);
            make.height.equalTo(uiLabel.mas_height);
            make.top.equalTo(uiLabel.mas_top);
            make.left.equalTo(uiLabel.mas_right).with.offset(40.0f);
            self.lastView = uiSwitch;
        }];

        [self.buttons addObject:uiSwitch];
        self.topPadding = 0.0f;
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
