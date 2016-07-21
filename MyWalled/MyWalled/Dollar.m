//
//  Dollar.m
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Dollar.h"

@interface Dollar()
// For only writing inside class
@property (nonatomic) NSInteger amount;
@end


@implementation Dollar

-(instancetype) initWithAmount:(NSInteger) amount {
    
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}



-(Dollar *) times: (NSInteger) multiplier {
    
    Dollar *newDollar = [[Dollar alloc]
                     initWithAmount:self.amount * multiplier];
    
    return newDollar;
}



@end
