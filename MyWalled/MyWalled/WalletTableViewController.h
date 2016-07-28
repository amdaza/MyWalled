//
//  WalletTableViewController.h
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@interface WalletTableViewController : UITableViewController

-(id) initWithModel: (Wallet *) model;

@end
