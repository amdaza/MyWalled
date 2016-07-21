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

- (void) testThatTimesRaisesException {
    Money *money = [[Money alloc] initWithAmount:1];
    XCTAssertThrows([money times:2], @"Should throw an exception");
}

@end