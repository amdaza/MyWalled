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

/*
 // Now we use Money-Private.h for amount property

@interface Money()

@property (nonatomic) NSInteger amount;

@end
 */

@implementation Money

-(instancetype) initWithAmount:(NSInteger) amount {
    
    if (self = [super init]) {
        // Literal syntax
        _amount = @(amount);
    }
    return self;
}

-(Money *) times: (NSInteger) multiplier {
    
    // Shouldn't be called
    // Subclass should implement it
    
    return [self subclassResponsibility:_cmd];
}


#pragma mark - Overwritten
- (NSString *) description {
    
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], [self amount]];
}

-(BOOL) isEqual:(id)object {
    return [self amount] == [object amount];
}

-(NSUInteger) hash {
    
    return (NSUInteger) self.amount;
}

@end
