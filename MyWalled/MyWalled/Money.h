//
//  Money.h
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

-(instancetype) initWithAmount:(NSInteger) amount;

-(Money *) times: (NSInteger) multiplier;


@end
