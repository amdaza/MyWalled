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

-(instancetype) initWithAmount:(NSInteger) amount {
    
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}


-(void) times: (NSInteger) multiplier {
    self.amount *= multiplier;
}

@end
