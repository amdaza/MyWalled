//
//  EuroTests.m
//  MyWalled
//
//  Created by Alicia Daza on 18/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Euro.h"

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
    
    Euro *five = [[Euro alloc] initWithAmount: 5];
    Euro *product = [five times:2];
    
    XCTAssertEqual(10, product.amount,
                   @"Both amounts should be equal");
    
    product = [five times: 3];
    XCTAssertEqual(product.amount, 15,
                   @"Both amounts should be equal");
}


@end
