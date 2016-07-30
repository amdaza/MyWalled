//
//  Money.m
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Broker.h"
//#import "Money-Private.h"

/*
 // Now we use Money-Private.h for amount property

@interface Money()

@property (nonatomic) NSInteger amount;

@end
 */


@interface Money ()

@property (nonatomic, strong) NSNumber *amount;

@end

@implementation Money


+(id) euroWithAmount:(NSInteger) amount {
    return [[Money alloc] initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount {
    return [[Money alloc] initWithAmount:amount currency:@"USD"];
}



-(id) initWithAmount: (NSInteger) amount
                      currency: (NSString *) currency {
    
    if (self = [super init]) {
        // Literal syntax
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id<Money>) times: (NSInteger) multiplier {
        
    Money *newMoney = [[Money alloc]
                             initWithAmount:[self.amount integerValue] * multiplier
                       currency: self.currency];
        
    return newMoney;
    
}

-(id<Money>) plus: (Money *) other {
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    Money *total = [[Money alloc] initWithAmount:totalAmount
                                        currency:self.currency];
    
    return total;
}


-(id<Money>) reduceToCurrency: (NSString *) currency
                    withBoker: (Broker *) broker {
    
    Money *result;
    
    // Check currencies are the same
    if ([self.currency isEqual:currency]) {
        return result = self;
    }
    
    
    double rate = [[broker.rates
                    objectForKey:[broker keyFromCurrency:self.currency
                                            toCurrency:currency]] doubleValue];
    if (rate == 0) {
        // No conversion rate, throw exception
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@",
         self.currency, currency];
    } else {
        // Conversion exists
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[Money alloc] initWithAmount:newAmount
                                      currency:currency];
    }
    
    
    
    
    return result;
}


#pragma mark - Overwritten
- (NSString *) description {
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class], self.currency, self.amount];
}

-(BOOL) isEqual:(id)object {
    return [[self currency] isEqual: ([object currency])]
            && [[self amount] isEqual: ([object amount])];
}

-(NSUInteger) hash {
    
    return [self.amount integerValue];
}

@end
