//
//  JETSTableCtrl.h
//  SQLite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JETSUpdateData.h"
@interface JETSTableCtrl : UITableViewController <UITableViewDelegate, UITableViewDataSource,JETSUpdateData>
- (IBAction)addContact:(id)sender;
@property NSMutableArray *myData;
@end
