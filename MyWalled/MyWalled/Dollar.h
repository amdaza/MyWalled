//
//  Dollar.h
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Money.h"

@interface Dollar : Money


-(instancetype) initWithAmount:(NSInteger) amount;

-(Dollar *) times: (NSInteger) multiplier;

@end
