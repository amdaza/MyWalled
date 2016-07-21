//
//  GNUStepAddons+GNUStepAddons.m
//  MyWalled
//
//  Created by Alicia Daza on 21/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

- (id) subclassResponsibility: (SEL)aSel {
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise: NSInvalidArgumentException
        format:@"%@%c%@ should be overriden by its subclass",
        NSStringFromClass([self class]), prefix,
        NSStringFromSelector(aSel)];
    
    return self; // not reached
}

@end
