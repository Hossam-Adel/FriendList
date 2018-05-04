//
//  JETSFriendDetailsViewController.h
//  SQLite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JETSFriend.h"

@interface JETSFriendDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *phone;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property JETSFriend *friend;

@end
