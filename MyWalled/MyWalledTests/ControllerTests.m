//
//  ControllerTests.m
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"

@interface ControllerTests : XCTestCase

@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    
    // Create laboratory environment
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Test" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
}

- (void)tearDown {
    // Destroy lab
    
    [super tearDown];
}

- (void)testTextOnLabelOnPushedButton{
    // Send message
    [self.simpleVC displayText: self.button];
    
    // Check that label and button have the same text
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

@end
