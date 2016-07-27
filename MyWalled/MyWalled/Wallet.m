//
//  Wallet.m
//  MyWalled
//
//  Created by Alicia Daza on 27/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Wallet.h"

@interface Wallet()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation Wallet

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *)currency {
    
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount
                                            currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject: money];
    }
    return self;
}



@end
