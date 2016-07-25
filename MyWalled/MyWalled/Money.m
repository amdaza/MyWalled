//
//  Money.m
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Money-Private.h"
#import "Money.h"
#import "Money.h"

/*
 // Now we use Money-Private.h for amount property

@interface Money()

@property (nonatomic) NSInteger amount;

@end
 */

@implementation Money


+(id) euroWithAmount:(NSInteger) amount {
    return [[Money alloc] initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount {
    return [[Money alloc] initWithAmount:amount currency:@"USD"];
}



-(instancetype) initWithAmount: (NSInteger) amount
                      currency: (NSString *) currency {
    
    if (self = [super init]) {
        // Literal syntax
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id) times: (NSInteger) multiplier {
        
    Money *newMoney = [[Money alloc]
                             initWithAmount:[self.amount integerValue] * multiplier
                       currency: self.currency];
        
    return newMoney;
    
}


#pragma mark - Overwritten
- (NSString *) description {
    
    return [NSString stringWithFormat:@"<%@ %ld>",
            [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object {
    return [self amount] == [object amount];
}

-(NSUInteger) hash {
    
    return (NSUInteger) self.amount;
}

@end
