//
//  mbaLabelsView.m
//  car
//
//  Created by Martin Bartusek on 28.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaLabelsView.h"
#import "Masonry.h"

@implementation mbaLabelsView

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.labels = [[NSMutableArray alloc] init];
        self.topPadding = 0.0f;
        self.btnHeight = 40.0f;
        
    }
    return self;
}

- (void)addLabel:(NSDictionary *)label {
    
    if (self.lastView == nil) {
        self.lastView = self.headline;
    }
    
    if ([label[@"show"] boolValue] == false) {
        self.topPadding += self.btnHeight;
        return;
        // NOTREACHED
    }
    UILabel *uiLabel = [self getLabel:label[@"id"]];
    NSString *text = [NSString stringWithFormat:@"%@ %@", label[@"value"] , label[@"unit"]];
    
    if (uiLabel != nil) {
        [uiLabel setText:text];
    }
    else {
        UILabel *uiTitle = [[UILabel alloc] init];
        uiTitle.text = label[@"title"];
        [self addSubview:uiTitle];
        
        uiLabel = [[UILabel alloc] init];
        uiLabel.text = text;
        uiLabel.tag  = [label[@"id"] intValue];
        [self addSubview:uiLabel];
        
        [uiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@400);
            make.width.greaterThanOrEqualTo(@200);
            make.height.equalTo(@60.0);
            make.top.equalTo(self.lastView.mas_top).with.offset(50.0f + self.topPadding);
            make.centerX.equalTo(self.headline.mas_centerX).with.offset(-50.0f);
            
            self.lastView = uiLabel;
        }];
        
        [uiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@100);
            make.height.equalTo(uiTitle.mas_height);
            make.top.equalTo(uiTitle.mas_top);
            make.left.equalTo(uiTitle.mas_right).with.offset(40.0f);
        }];
        
        [self.labels addObject:uiLabel];
    }
    
    self.topPadding = 0.0f;
}

- (UILabel *)getLabel:(NSNumber *)labelId {
    for (UILabel *label in self.labels) {
        if (label.tag == [labelId intValue]) {
            return label;
        }
    }
    return nil;
}

@end
