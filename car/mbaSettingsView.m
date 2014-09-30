//
//  mbaSettingsView.m
//  car
//
//  Created by Martin Bartusek on 21.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaSettingsView.h"
#import "mbaSettingsViewController.h"
#import "Masonry.h"

@implementation mbaSettingsView

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
    }
    
    return self;
}

- (void)renderIpAddressForm:(NSString *)ipAddress {

    self.ipAddressField = [[UITextField alloc] init];
    
    if (ipAddress) {
        [self.ipAddressField setText:ipAddress];
    }

    [self.ipAddressField setFont:[UIFont systemFontOfSize:24.0f]];
    [self.ipAddressField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.ipAddressField setTextColor:[UIColor blackColor]];
    [self.ipAddressField setBackgroundColor:[UIColor grayColor]];
    [self.ipAddressField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.ipAddressField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.ipAddressField setClearButtonMode:UITextFieldViewModeNever];
    [self.ipAddressField setInputView:nil];
    [self.ipAddressField setInputAccessoryView:nil];
    [self.ipAddressField addTarget:self.controller action:@selector(ipAddressFieldUpdated:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:self.ipAddressField];
    
    [self.ipAddressField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(@400);
        make.width.greaterThanOrEqualTo(@200);
        make.height.equalTo(@40.0);
        make.top.equalTo(self.mas_top).with.offset(200.0f);
        make.centerX.equalTo(self.mas_centerX);
    }];
    

    
}

@end
