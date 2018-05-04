//
//  JETSCollectionController.h
//  SQLite
//
//  Created by JETS on 2/28/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JETSMyProtocol.h"

@interface JETSCollectionController : UICollectionViewController

@property NSMutableArray *images;
@property id<JETSMyProtocol> delegate;

@end
