//
//  Broker.m
//  MyWalled
//
//  Created by Alicia Daza on 25/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Broker.h"
#import "Money.h"

@interface Broker ()

@property (nonatomic, strong) NSMutableDictionary *rates;

@end

@implementation Broker

- (id) init {
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

- (Money *) reduce: (Money *) money
        toCurrency: (NSString *) currency{
    
    NSInteger rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                         toCurrency:currency]] integerValue];
    
    NSInteger newAmount = [money.amount integerValue] * rate;
    
    Money *newMoney = [[Money alloc] initWithAmount:newAmount
                                           currency:currency];
    
    return newMoney;
}


- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency: fromCurrency toCurrency: toCurrency]];
}

#pragma mark - utils
- (NSString *) keyFromCurrency: (NSString *) fromCurrency
                    toCurrency: (NSString *) toCurrency {
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
