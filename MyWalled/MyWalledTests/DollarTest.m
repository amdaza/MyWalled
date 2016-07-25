//
//  DollarTest.m
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"
#import "Money.h"

@interface DollarTest : XCTestCase

@end

@implementation DollarTest

- (void)testSimpleMultiplication {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Dollar *five = [Money dollarWithAmount: 5];
    Dollar *product = [five times:2];
    Dollar *shouldResult = [Money dollarWithAmount: 10];
    
    XCTAssertEqualObjects(shouldResult, product,
                          @"$5 times 2 should be $10");
    
    product = [five times: 3];
    shouldResult = [Money dollarWithAmount: 15];
    
    XCTAssertEqualObjects(product, shouldResult,
                          @"$5 times 3 should be $15");
}

-(void) testEquality {
    Dollar *five = [Money dollarWithAmount:5];
    Dollar *ten = [Money dollarWithAmount:10];
    Dollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,
                          @"Objects with same amount should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

-(void) testHash {
    
    Dollar *a = [Money dollarWithAmount:2];
    Dollar *b = [Money dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],
                   @"Equal obejects must have same hash");
}



// Testing private interface exception
// JUST because some bug was detected
- (void) testAmountStorage {
    
    Dollar *dollar = [Money dollarWithAmount:2];
    
    // Cannot access directly to Dollar amount.
    // Send message
    
    // Returns id. Would be useful working with objects
    // But here we need an NSinteger
    //[dollar performSelector:<#(SEL)#>];
    
    // Shut warning up
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue], @"Amount should be the same as stored");
    
#pragma clang diagnostic pop
    
}


@end
