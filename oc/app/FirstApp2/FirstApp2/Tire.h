//
//  Tire.h
//  FirstApp2
//
//  Created by lijunjie on 23/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#ifndef Tire_h
#define Tire_h

# import <Cocoa/Cocoa.h>

@protocol NSCopying
- (id) copyWithZone: (NSZone *) zone;
@end

@protocol NSCoding
-(void) encodeWithCoder: (NSCoder *) encoder;
-(id) initWithCoder: (NSCoder *) decoder;

@end


@interface Tire : NSObject
{
    float pressure;
    float threadDepth;
}
- (id) initWithPressure: (float) pressure;
- (id) initWithThreadDepth: (float) threadDepth;
- (id) initWithPressure: (float) pressure threadDepth:(float) threadDepth;
- (void) setPressure:(float) pressure;
- (float) pressure;
- (void) setThreadDepth:(float) threadDepth;
- (NSString *) description;
@end

@interface Engine : NSObject <NSCopying>
@end


@interface Slant6 : Engine
@end


@interface AllWeatherRedial: Tire
{
    float rainHandling;
    float snowHandling;
    
}

@property float rainHandling;
@property float snowHandling;

@end


#endif /* Tire_h */
