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

@end
