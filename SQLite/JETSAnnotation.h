//
//  JETSAnnotation.h
//  SQLite
//
//  Created by JETS on 3/1/18.
//  Copyright © 2018 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface JETSAnnotation : NSObject <MKAnnotation>
@property CLLocationCoordinate2D coordinate;
@property (readwrite)NSString *title;
@property (readwrite)NSString *subtitle;
@end
