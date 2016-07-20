//
//  Money.m
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Money.h"

@interface Money()

@property (nonatomic) NSInteger amount;

@end

@implementation Money

-(instancetype) initWithAmount:(NSInteger) amount {
    
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

-(Money *) times: (NSInteger) multiplier {
    
    // Shouldn't be called
    
    Money *newMoney = [[Money alloc]
                         initWithAmount:self.amount * multiplier];
    
    return newMoney;
}

@end
