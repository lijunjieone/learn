//
//  Garage.m
//  FirstApp2
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "Garage.h"

@implementation Garage
@synthesize name;
-(void) addCar: (Car *) car
{
    if(cars == nil) {
        cars = [ [ NSMutableArray alloc ] init ];
        
    }
    [cars addObject:car];
    
}

- (void) dealloc
{
    [name release];
    [cars release];
    [super dealloc];
}

- (void) print
{
    NSLog (@"%@:",name);
    for(Car *car in cars) {
//        NSLog(@"car %@",car);
        [car print];
    }
}

@end
