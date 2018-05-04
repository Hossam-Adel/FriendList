//
//  JETSViewController.h
//  SQLite
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "JETSMyProtocol.h"
#import "JETSFriend.h"
#import "JETSMapProtocol.h"
#import "JETSUpdateData.h"
@interface JETSViewController : UIViewController <JETSMyProtocol,JETSMapProtocol>
@property (strong , nonatomic) IBOutlet UITextField *name;
@property (strong , nonatomic) IBOutlet UITextField *address;
@property (strong , nonatomic) IBOutlet UITextField *phone;
@property (strong , nonatomic) IBOutlet UILabel *status;
@property (strong , nonatomic) NSString *databasePath;
//@property (nonatomic) sqlite3 *contactDB;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property NSString *imagename;
- (IBAction)addImage:(id)sender;
@property JETSFriend *friend;
+(void)creatDB;
+(sqlite3*)
-(IBAction)saveData:(id)sender;
-(IBAction)findContact:(id)sender;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(NSMutableArray*)getContacts ;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *latitude;
- (IBAction)addLocation:(id)sender;
@property id<JETSUpdateData>updateDelegate;
@end
