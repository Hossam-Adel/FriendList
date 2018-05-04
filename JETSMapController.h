//
//  JETSMapController.h
//  SQLite
//
//  Created by JETS on 3/1/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "JETSMapProtocol.h"
@interface JETSMapController : UIViewController <MKAnnotation>
- (IBAction)hamadaTouched:(id)sender;

@property id<JETSMapProtocol>mapDelegate;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
