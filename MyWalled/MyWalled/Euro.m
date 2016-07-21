//
//  Euro.m
//  MyWalled
//
//  Created by Alicia Daza on 18/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Euro.h"

@interface Euro()
// For only writing inside class
@property (nonatomic) NSInteger amount;
@end

@implementation Euro

-(Euro *) times: (NSInteger) multiplier {
    
    Euro *newEuro = [[Euro alloc]
                     initWithAmount:self.amount * multiplier];
    
    return newEuro;
}



@end
