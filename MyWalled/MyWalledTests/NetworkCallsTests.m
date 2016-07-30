//
//  NetworkCallsTests.m
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Broker.h"


@interface NetworkCallsTests : XCTestCase

@end

@implementation NetworkCallsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)emptyRatesDefaultsToOneToOne {
    
}

-(void)emptyRatesRaisesException {
    Broker *b = [Broker new];
    NSData * json = nil;
    XCTAssertThrows([b parseJsonData:json],
                    @"Empty json should raise exception");
    
    
}

@end
