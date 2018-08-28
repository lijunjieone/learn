//
//  Car.h
//  FirstApp2
//
//  Created by lijunjie on 23/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#ifndef Car_h
#define Car_h

# import <Cocoa/Cocoa.h>
#import "Tire.h"

@interface Car : NSObject <NSCopying> {
    NSString *name;
    Engine *engine;
    NSMutableArray *tires;
    NSString *make;
    NSString *model;
    int modelYear;
    int numberOfDoors;
    float mileage;
    

    
}
@property (copy) NSString *name;
@property (retain) Engine *engine;
@property (readwrite,copy) NSString *make;
@property (readwrite,copy) NSString *model;
@property (readwrite) int modelYear;
@property (readwrite) int numberOfDoors;
@property (readwrite) float mileage;

- (Tire *) tireAtIndex:(int) index;
- (void) setTire: (Tire *) tire atIndex: (int)index;
- (void) print;

@end
#endif /* Car_h */

