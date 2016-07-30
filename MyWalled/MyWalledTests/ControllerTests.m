//
//  ControllerTests.m
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllerTests : XCTestCase

@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) WalletTableViewController *walletTVC;
@property (nonatomic, strong) Wallet *wallet;

@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    
    // Create laboratory environment
    
    // Button & label
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Test" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;

    // Wallet table
    self.wallet = [[Wallet alloc] initWithAmount:1
                                        currency:@"USD"];
    [self.wallet plus: [Money euroWithAmount:1]];
    self.walletTVC = [[WalletTableViewController alloc] initWithModel: self.wallet];
}

- (void)tearDown {
    // Destroy lab
    
    [super tearDown];
}


// Button & label text test
- (void)testTextOnLabelOnPushedButton{
    // Send message
    [self.simpleVC displayText: self.button];
    
    // Check that label and button have the same text
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}


-(void) testTableHasOneSection {
    
    NSUInteger sections = [self.walletTVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, wallet.currenciesCount +1,
                   @"Only one section");
}

-(void) testNumberOfCells {
    XCTAssertEqual(self.wallet.count +1, [self.walletTVC tableView:nil numberOfRowsInSection:0],
                   @"Number of cells should be number of moneys plus one");
}

@end
