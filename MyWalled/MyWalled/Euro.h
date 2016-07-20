//
//  Euro.h
//  MyWalled
//
//  Created by Alicia Daza on 18/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Money.h"

@interface Euro : Money

-(instancetype) initWithAmount:(NSInteger) amount;

-(Euro *) times: (NSInteger) multiplier;

@end
