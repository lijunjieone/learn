//
//  Garage.h
//  FirstApp2
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@interface Garage : NSObject
{
    NSString *name;
    NSMutableArray *cars;
    
}

@property (readwrite,copy) NSString *name;
- (void) addCar: (Car *) car;
- (void) print;

@end
