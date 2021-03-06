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


}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction {
    
    Broker *broker = [Broker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    Wallet *wallet = [[Wallet alloc] initWithAmount: 40 currency: @"EUR"];
    
    [wallet plus: [Money dollarWithAmount: 20]];
    Money *reduced = [broker reduce: wallet toCurrency: @"USD"];
    
    XCTAssertEqualObjects(reduced, [Money dollarWithAmount:100],
                          @"€40 + $20 = $100 2:1");
}

-(void) testSubtotalOfCurrency{
    
    Wallet *wallet = [[Wallet alloc] initWithAmount: 40 currency: @"USD"];
    [wallet plus: [Money dollarWithAmount: 30]];
    [wallet plus: [Money dollarWithAmount: 15]];
    
    Money *subtotal = [wallet totalMoneysOfCurrency:@"USD"];
    
    XCTAssertEqualObjects(subtotal, [Money dollarWithAmount:85], @"Subtotal($40 + $30 + 15) == $85");
}


-(void) testTakeMoneyWhenExists {
    Wallet *wallet = [[Wallet alloc] initWithAmount: 40 currency: @"USD"];
    [wallet plus: [Money dollarWithAmount: 30]];
    [wallet plus: [Money dollarWithAmount: 15]];
    
    [wallet takeMoney:[Money dollarWithAmount:15]];
    
    Money *subtotal = [wallet totalMoneysOfCurrency:@"USD"];
    
    XCTAssertEqualObjects(subtotal, [Money dollarWithAmount:70], @"Existing money should be deleted");
    
}


-(void) testTakeMoneyWhenNotExists {
    Wallet *wallet = [[Wallet alloc] initWithAmount: 40 currency: @"USD"];
    
    ;
    
    XCTAssertThrows([wallet takeMoney:[Money dollarWithAmount:15]],
                    @"Non existing money should throw an exception");
    
}

@end
