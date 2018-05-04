//
//  JETSFriendDetailsViewController.m
//  SQLite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "JETSFriendDetailsViewController.h"

@interface JETSFriendDetailsViewController ()

@end

@implementation JETSFriendDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_name setText:_friend.name];
    [_phone setText:_friend.phone];
    [_image setImage:[UIImage imageNamed:@"IMG_20170527_200548.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
