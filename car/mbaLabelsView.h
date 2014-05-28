//
//  mbaLabelsView.h
//  car
//
//  Created by Martin Bartusek on 28.05.14.
//  Copyright (c) 2014 Martin Bartusek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mbaLabelsView : UIView
@property (weak, nonatomic) IBOutlet UILabel *headline;

@property (weak, nonatomic) UIView *lastView;
@property (strong, nonatomic) NSMutableArray *labels;

- (void)addLabel:(NSDictionary *)label;

@end
