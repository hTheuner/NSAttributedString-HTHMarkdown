//
//  HTHViewController.m
//  NSAttributedString-Markdown
//
//  Created by Theuner, Heiko on 12/10/14.
//  Copyright (c) 2014 Theuner, Heiko. All rights reserved.
//

#import "HTHViewController.h"

@interface HTHViewController ()

@property (nonatomic) UILabel *label;

@end

@implementation HTHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.numberOfLines = 0;
        label.text = @"s";
        
        self.label = label;
    })];
    
    [self applyContraints];
}

- (void)applyContraints
{
    [self.label.superview addConstraint:({
        [NSLayoutConstraint
         constraintWithItem: self.label
         attribute: NSLayoutAttributeCenterX
         relatedBy: NSLayoutRelationEqual
         toItem: self.label.superview
         attribute: NSLayoutAttributeCenterX
         multiplier: 1.0
         constant: 0];
    })];
    
    [self.label.superview addConstraint:({
        [NSLayoutConstraint
         constraintWithItem: self.label
         attribute: NSLayoutAttributeCenterY
         relatedBy: NSLayoutRelationEqual
         toItem: self.label.superview
         attribute: NSLayoutAttributeCenterY
         multiplier: 1.0
         constant: 0];
    })];
    
    [self.label.superview addConstraint:({
        [NSLayoutConstraint
         constraintWithItem: self.label
         attribute: NSLayoutAttributeWidth
         relatedBy: NSLayoutRelationEqual
         toItem: self.label.superview
         attribute: NSLayoutAttributeWidth
         multiplier: 3.f / 4.f
         constant: 0];
    })];
    
}

@end
