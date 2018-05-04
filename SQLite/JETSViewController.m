//
//  JETSViewController.m
//  SQLite
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "JETSViewController.h"
#import "JETSTableCtrl.h"
#import "JETSFriend.h"
#import "JETSCollectionController.h"
#import "JETSMapController.h"
@interface JETSViewController ()

@end

@implementation JETSViewController
static sqlite3 *contactDB;

- (id)init{
    [self creatDB];
    return self;
}
- (IBAction)addImage:(id)sender {
    JETSCollectionController *ctrlr =[self.storyboard instantiateViewControllerWithIdentifier:@"images"];
    [ctrlr setDelegate:self];
    
    [self.navigationController pushViewController:ctrlr animated:NO];
}

-(void)creatDB{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      @"contacts2.db"]];
    
    
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        char *errMsg;
        const char *sql_stmt =
        "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT,IMAGE TEXT)";
        
        if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            _status.text = @"Failed to create table";
        }
        sqlite3_close(contactDB);
    } else {
        _status.text = @"Failed to open/create database";
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [JETSViewController creatDB];
    }


-(void)saveData:(id)sender{
    
    
    sqlite3_stmt    *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO CONTACTS (name, address, phone, image) VALUES (\"%@\", \"%@\", \"%@\",\"%@\")",
                               _name.text, _address.text, _phone.text,_imagename];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(contactDB, insert_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            _status.text = @"Contact added";
            _name.text = @"";
            _address.text = @"";
            _phone.text = @"";
        } else {
            _status.text = @"Failed to add contact";
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
        [_updateDelegate update];
        [self.navigationController popViewControllerAnimated:NO];
        printf("%s","update done");
    }
    
    
}

-(void)findContact:(id)sender{
    
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT address, phone FROM contacts WHERE name=\"%@\"",
                              _name.text];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *addressField = [[NSString alloc]
                                          initWithUTF8String:
                                          (const char *) sqlite3_column_text(
                                                                             statement, 0)];
                _address.text = addressField;
                NSString *phoneField = [[NSString alloc]
                                        initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement, 1)];
                _phone.text = phoneField;
                _status.text = @"Match found";
            } else {
                _status.text = @"Match not found";
                _address.text = @"";
                _phone.text = @"";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
        }
    
    
}

-(NSMutableArray*)getContacts{
    
    NSMutableArray *friends = [NSMutableArray new];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    printf("%s %s","hello",sqlite3_errmsg(contactDB));
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT * FROM contacts"];
                const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
           
                while(sqlite3_step(statement) == SQLITE_ROW){
                    JETSFriend *friend = [JETSFriend new];
                    
                    friend.name = [[NSString alloc]
                                            initWithUTF8String:(const char *)
                                            sqlite3_column_text(statement, 1)];
                    friend.phone = [[NSString alloc]
                                   initWithUTF8String:(const char *)
                                   sqlite3_column_text(statement, 2)];
                    friend.address =[[NSString alloc]
                                     initWithUTF8String:(const char *)
                                     sqlite3_column_text(statement, 3)];
                    friend.imagename = [[NSString alloc]
                                    initWithUTF8String:(const char *)
                                    sqlite3_column_text(statement, 3)];
                    [friends addObject:friend];
                }
                
            
            sqlite3_finalize(statement);
        }else {
            printf("%s %s","hello",sqlite3_errmsg(contactDB));

        }
        sqlite3_close(contactDB);
    }
    
    return friends;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)setobject:(NSString*)imageName{
    [_image setImage:[UIImage imageNamed:imageName]];
    _imagename =imageName;
}
- (IBAction)addLocation:(id)sender {
    JETSMapController *mapctrllr = [self.storyboard instantiateViewControllerWithIdentifier:@"map"];
    [mapctrllr setMapDelegate:self];
    [self.navigationController pushViewController:mapctrllr animated:NO];
}
-(void)setLongitude:(double)lon latitude:(double)lat{
    [_latitude setText:[NSString stringWithFormat:@"%f",lon]];
    [_longitude setText:[NSString stringWithFormat:@"%f",lat]];
  
}

@end
