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

@property (nonatomic, strong) Broker *emptyBroker;
@property (nonatomic, strong) Money *oneDollar;

@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyBroker = [Broker new];
    self.oneDollar = [Money dollarWithAmount:1];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}


- (void) testSimpleReduction {
    
    Money *sum = [[Money dollarWithAmount:5] plus:[Money dollarWithAmount:5]];
    
    Money *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}



-(void) testReduction {
    
    [self.emptyBroker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    
    Money *dollars = [Money dollarWithAmount:10];
    Money *euros = [Money euroWithAmount:5];

    Money *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void) testNoRateRaisesException {
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar
                                  toCurrency:@"EUR"],
                    @"No rates info should throw exception");
}

-(void) testNilConversionDoesNotChangeMoney {
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar
                                                        toCurrency:@"USD"],
                          @"Nil conversion shouldn't produce any changes");
}





@end
