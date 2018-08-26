//
//  Car.m
//  FirstApp2
//
//  Created by lijunjie on 23/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "Car.h"

@implementation Car
@synthesize name;
@synthesize engine;

-(id) init {
    if(self == [super init ]) {
        name = [ [NSString alloc] initWithString:@"Car"];
        engine = [Engine new];
        tires = [ [ NSMutableArray alloc] init];
        for(int i=0;i<4;i++) {
            [ tires addObject:[NSNull null]];
        }
    }
    return (self);
}

- (void) dealloc
{
    [ name release];
    [ tires release];
    [ engine release];
    [ super dealloc];
}


- (Tire *) tireAtIndex:(int) index {
    Tire *tire;
    tire = [ tires objectAtIndex: index];
    return tire;
}

- (void) setTire:(Tire *) tire atIndex: (int)index {
    [ tires replaceObjectAtIndex:index withObject:tire];
}

- (void) print {
    NSLog(@"e:%@ ,%@,t1:%@,t2:%@,t3:%@,t4:%@",name,engine,tires[0],tires[1],tires[2],tires[3]);
}
@end
