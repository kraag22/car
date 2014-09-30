//
//  mbaBaseView.m
//  car
//
//  Created by Martin Bartusek on 30.09.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import "mbaBaseView.h"
#import "Masonry.h"

@interface mbaBaseView ()

@end

@implementation mbaBaseView

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (void)createConnectedBtn {
    self.connectedBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

    [self.connectedBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft]; // zarovnani obsahu vlevo
    [self.connectedBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter]; // svisle na stred vysky
    
    [self addSubview:self.connectedBtn];
    
    [self updateConnectedBtn:NO];
    
    [self.connectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@60.0);
        make.top.equalTo(self.mas_top).with.offset(20.0f);
        make.left.equalTo(self.mas_left).with.offset(20.0f);
    }];
}

- (void)updateConnectedBtn:(BOOL)isConnected {
    if (isConnected) {
        [self.connectedBtn setTitle:@"připojeno" forState:UIControlStateNormal];
        [self.connectedBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    else {
        [self.connectedBtn setTitle:@"nepřipojeno" forState:UIControlStateNormal];
        [self.connectedBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

@end
