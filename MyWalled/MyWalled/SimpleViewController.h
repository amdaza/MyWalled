//
//  SimpleViewController.h
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;


@end
