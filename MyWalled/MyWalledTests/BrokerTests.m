//
//  BrokerTests.m
//  MyWalled
//
//  Created by Alicia Daza on 25/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"

@interface BrokerTests : XCTestCase

@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void) testSimpleReduction {
    
    Broker *broker = [[Broker alloc] init];
    
    Money *sum = [[Money dollarWithAmount:5] plus:[Money dollarWithAmount:5]];
    
    Money *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}



-(void) testReduction {
    
    Broker *broker = [Broker new];
    [broker addRate: 2 fromCurrency: @"USD" toCurrency: @"EUR"];
    
    Money *dollars = [Money dollarWithAmount:10];
    Money *euros = [Money euroWithAmount:5]; 

    Money *converted = [broker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}


@end
