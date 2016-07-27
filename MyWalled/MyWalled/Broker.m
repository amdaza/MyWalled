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

- (id<Money>) reduce: (Money *) money
        toCurrency: (NSString *) currency{
    
    Money *result;
    
    // Check currencies are the same
    if ([money.currency isEqual:currency]) {
        return result  = money;
    }
    
    
    double rate = [[self.rates
                       objectForKey:[self keyFromCurrency:money.currency
                                               toCurrency:currency]] doubleValue];
    if (rate == 0) {
        // No conversion rate, throw exception
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@",
                            money.currency, currency];
    } else {
        // Conversion exists
        NSInteger newAmount = [money.amount integerValue] * rate;
    
        result = [[Money alloc] initWithAmount:newAmount
                                      currency:currency];
    }
    
    
    
    
    return result;
}


- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency: fromCurrency toCurrency: toCurrency]];
    
    NSNumber *invRate = @(1.0/rate);
    
    [self.rates setObject: invRate
                   forKey: [self keyFromCurrency: toCurrency toCurrency: fromCurrency]];
}

#pragma mark - utils
- (NSString *) keyFromCurrency: (NSString *) fromCurrency
                    toCurrency: (NSString *) toCurrency {
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
