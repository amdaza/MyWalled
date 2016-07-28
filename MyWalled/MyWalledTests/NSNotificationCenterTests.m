//
//  NSNotificationCenterTests.m
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FakeNotificationCenter.h"
#import "Wallet.h"

@interface NSNotificationCenterTests : XCTestCase

@end

@implementation NSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) subscribesToMemoryWarning {
    
    FakeNotificationCenter *fake = [FakeNotificationCenter new];
    Wallet *fat = [Wallet new];
    
    [fat subscribeToMemoryWarning: (NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, fat,
                          @"Fat objecct must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
    
}


@end
