//
//  JETSMapController.m
//  SQLite
//
//  Created by JETS on 3/1/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "JETSMapController.h"
#import "JETSAnnotation.h"
@interface JETSMapController ()

@end

@implementation JETSMapController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)hamadaTouched:(id)sender {
    printf("%s","map tpuched");
    CGPoint point = [sender locationInView:_mapView];
    CLLocationCoordinate2D touched_location = [_mapView convertPoint:point toCoordinateFromView:_mapView];
    JETSAnnotation *annottion = [JETSAnnotation new];
    [annottion setCoordinate:touched_location];
    [annottion setTitle:@"Hossam"];
    [_mapView addAnnotation:annottion];
    [annottion setTitle:@"ITI"];
    [_mapDelegate setLongitude:touched_location.longitude latitude:touched_location.latitude];
    [self.navigationController popViewControllerAnimated:NO];
    printf("%f",touched_location.latitude);
}
@end
