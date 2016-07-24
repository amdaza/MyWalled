//
//  EuroTests.m
//  MyWalled
//
//  Created by Alicia Daza on 18/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Euro.h"
#import "Money.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleMultiplication {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Euro *five = [Money euroWithAmount: 5];
    Euro *product = [five times:2];
    Euro *shouldResult = [[Euro alloc] initWithAmount: 10];
    
    XCTAssertEqualObjects(shouldResult, product,
                   @"€5 times 2 should be €10");
    
    product = [five times: 3];
    shouldResult = [[Euro alloc] initWithAmount: 15];
    
    XCTAssertEqualObjects(product, shouldResult,
                   @"€5 times 3 should be €15");
}

-(void) testEquality {
    Euro *five = [[Euro alloc] initWithAmount:5];
    Euro *ten = [[Euro alloc] initWithAmount:10];
    Euro *total = [five times:2];

    XCTAssertEqualObjects(ten, total,
                         @"Objects with same amount should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

-(void) testHash {
    
    Euro *a = [[Euro alloc] initWithAmount:2];
    Euro *b = [[Euro alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],
                   @"Equal obejects must have same hash");
}


// Testing private interface exception
// JUST because some bug was detected
- (void) testAmountStorage {

    Euro *euro = [[Euro alloc] initWithAmount:2];
    
    // Cannot access directly to euro amount.
    // Send message
    
    // Returns id. Would be useful working with objects
    // But here we need an NSinteger
    //[euro performSelector:<#(SEL)#>];
    
    // Shut warning up
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"Amount should be the same as stored");
    
#pragma clang diagnostic pop
    
}


@end
