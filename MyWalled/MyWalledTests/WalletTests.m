//
//  WalletTests.m
//  MyWalled
//
//  Created by Alicia Daza on 27/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"
#import "Wallet.h"

@interface WalletTests : XCTestCase

@end

@implementation WalletTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction {
    
    Broker *broker = [Broker new];
    [broker addRate: 2 fromCurrency:@"USD" toCurrency:@"EUR"];
    Wallet *wallet = [[Wallet alloc] initWithAmount: 40 currency: @"EUR"]:
    
    [wallet plus: Money dollarWithAmount: 20];
    Money *reduced = [broker reduce: wallet toCurrency: @"USD"];
    
    XCTAssertEqualObjects(reduced, [Money dollarWithAmount:100],
                          @"€40 + $20 = $100 2:1");
}





@end
