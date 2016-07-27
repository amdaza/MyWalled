//
//  Wallet.m
//  MyWalled
//
//  Created by Alicia Daza on 27/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Wallet.h"

@interface Wallet()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation Wallet

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *)currency {
    
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount
                                            currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject: money];
    }
    return self;
}

-(id<Money>) plus:(Money *)money {
    
    [self.moneys addObject: money];
    return self;
}

-(id<Money>) times:(NSInteger)multiplier {
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (Money *each in self.moneys) {
        Money *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

@end
