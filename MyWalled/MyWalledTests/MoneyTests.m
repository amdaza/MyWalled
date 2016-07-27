//
//  MoneyTests.m
//  MyWalled
//
//  Created by Alicia Daza on 21/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"

@interface MoneyTests : XCTestCase

@end

@implementation MoneyTests

-(void) testCurrencies {
    
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency],
                          @"Currency of euros (€) should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency],
                          @"Currency of dollars ($) should be USD");
}

- (void)testSimpleMultiplication {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Money *five = [Money euroWithAmount: 5];
    Money *product = [five times:2];
    Money *shouldResult = [Money euroWithAmount: 10];
    
    XCTAssertEqualObjects(shouldResult, product,
                          @"€5 times 2 should be €10");
    
    product = [five times: 3];
    shouldResult = [Money euroWithAmount: 15];
    
    XCTAssertEqualObjects(product, shouldResult,
                          @"€5 times 3 should be €15");
}

-(void) testEquality {
    Money *five = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,
                          @"Objects with same amount should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
    
    // Also test with dollars
    
    Money *fiveD = [Money dollarWithAmount:5];
    Money *tenD = [Money dollarWithAmount:10];
    Money *totalD = [fiveD times:2];
    
    XCTAssertEqualObjects(tenD, totalD,
                          @"Objects with same amount should be equal");
    
    XCTAssertFalse([totalD isEqual:fiveD], @"Non equivalent objects should not be equal");
}

-(void) testDifferentCurrencies {
    Money *euro = [Money euroWithAmount:1];
    Money *dollar = [Money dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies shouldn't be equal!");
}

-(void) testHash {
    
    Money *a = [Money euroWithAmount:2];
    Money *b = [Money euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],
                   @"Equal obejects must have same hash");
    
    // Also test with dollar
    Money *c = [Money dollarWithAmount:2];
    Money *d = [Money dollarWithAmount:2];
    
    XCTAssertEqual([c hash], [d hash],
                   @"Equal obejects must have same hash");
}


// Testing private interface exception
// JUST because some bug was detected
- (void) testAmountStorage {
    
    Money *euro = [Money euroWithAmount:2];
    
    Money *dollar = [Money dollarWithAmount:2];
    
    // Cannot access directly to euro amount.
    // Send message
    
    // Returns id. Would be useful working with objects
    // But here we need an NSinteger
    //[euro performSelector:<#(SEL)#>];
    
    // Shut warning up
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"Amount should be the same as stored");
    
    // Test also with dollar
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue], @"Amount should be the same as stored");
    
#pragma clang diagnostic pop
    
}

-(void) testSimpleAddition {
    
    Money * a = [Money dollarWithAmount:5];
    Money * b = [Money dollarWithAmount:5];
    Money * res = [Money dollarWithAmount:10];
    
    XCTAssertEqualObjects([a plus: b], res, @"$5 + $5 = $10");
}

-(void) testThatHashIsAmount {
    
    Money * one = [Money dollarWithAmount:1];
    
    XCTAssertEqual([one hash], 1, @"Hash is the amount");
}

-(void) testDescription {
    Money * one = [Money dollarWithAmount:1];
    
    NSString *desc = @"<Money: $1>";

    XCTAssertEqualObjects([one description], desc, @"Description as desired");
}

@end
