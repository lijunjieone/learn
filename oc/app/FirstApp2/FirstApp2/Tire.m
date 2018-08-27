//
//  Tire.m
//  FirstApp2
//
//  Created by lijunjie on 23/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "Tire.h"


@implementation Tire

-(id) initWithPressure: (float) p
{
    if(self = [super init ] )
    {
        pressure = p;
        threadDepth = 20.0;
        
    }
    return (self);
}

-(id) initWithThreadDepth:(float)threadDepth
{
    if(self = [ super init ] ) {
        self.threadDepth = threadDepth;
        pressure = 34.0;
    }
    
    return (self);
}

- (id) initWithPressure:(float)pressure threadDepth:(float)threadDepth {
    if(self == [ super init ]) {
        self.pressure = pressure;
        self.threadDepth = threadDepth;
    }
    
    
    return (self);
}

- (void) setPressure:(float) p
{
    pressure = p;
}

- (float) pressure
{
    return pressure;
    
}

- (void )  setThreadDepth:(float)depth
{
    threadDepth = depth;
}

- (float) threadDepth
{
    return threadDepth;
}


- (NSString *) description
{
    return @"I am Tire";
    
}
@end


@implementation Engine
- (NSString *) description
{
    return @"I am engne.";
}

- (id) copyWithZone:(NSZone *)zone
{
    Engine *engineCopy;
    engineCopy = [ [ [ self class ] allocWithZone: zone] init ];
    return (engineCopy);
    
}

@end



@implementation Slant6
- (NSString *) description
{
    return (@"I am a slant- 6. VROMM!");
    
}
@end


@implementation AllWeatherRedial

@synthesize rainHandling;
@synthesize snowHandling;


- (id) initWithPressure:(float)pressure threadDepth:(float)td
{
    if(self = [ super initWithPressure:pressure threadDepth:td]) {
        rainHandling = 23.7;
        snowHandling = 42.5;
    }
    
    return (self);
}


- (NSString *) description
{
    NSString *desc;
    desc  = [[NSString alloc] initWithFormat:@"AllWeatherRadial: %.1f /%.1f %.1f %.1f",[self pressure],[self threadDepth],[ self rainHandling],[ self snowHandling]];
    return (desc);
    
}
@end

