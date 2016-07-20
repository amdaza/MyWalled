//
//  DollarTest.m
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"

@interface DollarTest : XCTestCase

@end

@implementation DollarTest

- (void)testSimpleMultiplication {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Dollar *five = [[Dollar alloc] initWithAmount: 5];
    Dollar *product = [five times:2];
    Dollar *shouldResult = [[Dollar alloc] initWithAmount: 10];
    
    XCTAssertEqualObjects(shouldResult, product,
                          @"$5 times 2 should be $10");
    
    product = [five times: 3];
    shouldResult = [[Dollar alloc] initWithAmount: 15];
    
    XCTAssertEqualObjects(product, shouldResult,
                          @"$5 times 3 should be $15");
}

-(void) testEquality {
    Dollar *five = [[Dollar alloc] initWithAmount:5];
    Dollar *ten = [[Dollar alloc] initWithAmount:10];
    Dollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,
                          @"Objects with same amount should be equal");
}

@end
