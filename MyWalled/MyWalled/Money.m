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
#import "Euro.h"
#import "Dollar.h"

/*
 // Now we use Money-Private.h for amount property

@interface Money()

@property (nonatomic) NSInteger amount;

@end
 */

@implementation Money


+(id) euroWithAmount:(NSInteger) amount {
    return [[Euro alloc] initWithAmount:amount];
}

+(id) dollarWithAmount:(NSInteger) amount {
    return [[Dollar alloc] initWithAmount:amount];
}



-(instancetype) initWithAmount:(NSInteger) amount {
    
    if (self = [super init]) {
        // Literal syntax
        _amount = @(amount);
    }
    return self;
}

-(id) times: (NSInteger) multiplier {
        
    Money *newMoney = [[Dollar alloc]
                             initWithAmount:[self.amount integerValue] * multiplier];
        
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
