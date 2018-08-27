
//
//  main.m
//  FirstApp2
//
//  Created by lijunjie on 22/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tire.h"
#import "Car.h"
#import "NSString+Number2.h"
#import "CategoryThing.h"
#import "CategoryThing+Thing1.h"
#import "CategoryThing+Thing2.h"


BOOL areIntsdifferent(int thing1,int thing2)
{
    if(thing1==thing2) {
        return (NO);
    }
    else {
        return (YES);
    }
}

NSString *boolString(BOOL yesNo) {
    if(yesNo == NO) {
        return (@"NO");
    }
    else {
        return (@"YES");
    }
}

void test_array() {
    const char *word[4] = {"lijunjie","linian","jingyanli","mama"};
    
    int c = 4;
    for(int i=0;i<c;i++) {
        NSLog(@"%s is %lu char logn",word[i],strlen(word[i]));
    }
}

void test_for() {
    for(int i=0;i<10;i++) {
        NSLog(@"position:%d\n",i);
    }
}

void test_array2() {
    NSArray *array = @[@"one",@"two",@"three"];
    for(int i=0;i<[array count];i++) {
        NSLog(@"index %d has %@.",i,[array objectAtIndex:i]);
    }
}

void test_array3() {
    NSString *string=@"lijunjie:linian:jingyanli:mama";
    NSArray *chunks = [ string componentsSeparatedByString: @":"];
    string = [chunks componentsJoinedByString: @"+"];
    
    NSLog(@"%@",string);
    
}


void test_file1() {
    FILE *wordFile = fopen("/tmp/my/a.txt","r");
    char word[100];
    while(fgets(word,100,wordFile)) {
        word[strlen(word)-1] = '\0';
        NSLog(@"%s is %lu char long",word,strlen(word));
        
        
        
    }
    
    fclose(wordFile);
    
    
}

typedef enum {
    kCircle,
    kRectangle,
    kEgg
} ShapeType;

typedef enum {
    kRedColor,
    kGreenColor,
    kBlueColor
} ShapeColor;

typedef struct {
    int x,y,width,height;
} ShapeRect;

typedef struct {
    ShapeType type;
    ShapeColor fillColor;
    ShapeRect bounds;

} Shape;


void test_rect() {
    ShapeRect rect={0,0,10,10};
    ShapeRect rect1={1,2,20,20};
    
    Shape shapes[2];
    shapes[0].bounds=rect;
    shapes[0].fillColor = kRedColor;
    shapes[0].type=kCircle;
    
    shapes[1].bounds = rect1;
    shapes[1].fillColor = kGreenColor;
    shapes[1].type = kEgg;
    
    
    
}


@interface Circle :NSObject{
    @private
    ShapeColor fillColor;
    ShapeRect  bounds;
}

- (void) setFillColor:(ShapeColor) fillColor;
- (void) setBounds:(ShapeRect) bounds;
- (void) draw;
@end

@implementation Circle
- (void) setFillColor:(ShapeColor)c {
    fillColor = c;
}

- (void) setBounds:(ShapeRect)b {
    bounds = b;
}


//(NSString) str:(ShapeColor)c {
//    return @"Ns";
//}

- (void) draw {
    NSLog(@"drawing a circle at (%d,%d,%d,%d) in %@",bounds.x,bounds.y,bounds.width,bounds.height,@"fillColor");
}

@end


@interface Shape1 :NSObject{
    ShapeColor fillColor;
    ShapeRect  bounds;
}

- (void) setFillColor:(ShapeColor) fillColor;
- (void) setBounds:(ShapeRect) bounds;
- (void) draw;
@end

@implementation Shape1
- (void) setFillColor:(ShapeColor)c {
    fillColor = c;
}

- (void) setBounds:(ShapeRect)b {
    bounds = b;
}


//(NSString) str:(ShapeColor)c {
//    return @"Ns";
//}

- (void) draw {
    NSLog(@"drawing a circle at (%d,%d,%d,%d) in %@",bounds.x,bounds.y,bounds.width,bounds.height,@"fillColor");
}

@end


@interface Egg : Shape1
@end

@implementation Egg

-(void) draw {
    NSLog(@"drawing a Egg at (%d,%d,%d,%d) in %@",bounds.x,bounds.y,bounds.width,bounds.height,@"egg");
}

@end


void test_map1() {
    Tire *t1 = [ Tire new ];
    Tire *t2 = [ Tire new ];
    
    NSDictionary *tires = [NSDictionary dictionaryWithObjectsAndKeys:t1,@"t1",t2,@"t2", nil];
    NSDictionary *tires2 = @{@"t1":t1,@"t2":t2};
    
    NSLog(@"t1,%@",tires[@"t1"]);
    NSLog(@"t2,%@",tires2[@"t2"]);
    

    
}



void test_nsvalue1() {
    NSRect rect = NSMakeRect(1,2,30,40);
    NSValue *value = [NSValue valueWithBytes:&rect objCType:@encode(NSRect)];
    NSArray *array;
//    [array addObject:value];
    
    
}

void test_file2() {
    NSFileManager *manager;
    manager = [NSFileManager defaultManager];
    
    NSString *home;
    home = [ @"/tmp/my/" stringByExpandingTildeInPath];
    
    NSDirectoryEnumerator *direnum;
    direnum = [ manager enumeratorAtPath:home];
    
    NSMutableArray *files;
    
    files = [NSMutableArray arrayWithCapacity:42 ];
    
    NSString *filename;
    while(filename = [direnum nextObject ]) {
        NSLog(@"path:%@",filename);
        if([[ filename pathExtension ] isEqualToString: @"txt"]) {
            [files addObject:filename];
            
        }
    }
    
    NSEnumerator *fileenum;
    fileenum = [ files objectEnumerator ];
    while(filename = [ fileenum nextObject ]) {
        NSLog(@"%@",filename);
    }
    
}

void test_car() {
    Car *car;
    Engine *engine;
    car = [ Car new ];
    car.name = @"mazda6";
    engine = [ Slant6 new];
    [car setEngine: engine];
    for(int i=0;i<4;i++) {
        Tire *tire=[ AllWeatherRedial new];
        [ car setTire: tire atIndex: i];
        
    }
    [car print];
    
    
    
}


@interface RetainTracker :NSObject
@end

@implementation RetainTracker
- (id) init
{
    if(self = [ super init ]) {
        NSLog(@"init: Retain count of %d.",[self retainCount ]);
    }
    return (self);
}

- (void) dealloc
{
    NSLog(@"dealloc called. Bye Bye");
    [super dealloc];
}

@end


void test_retain() {
    RetainTracker *tracker = [ RetainTracker new];
    [tracker retain];
    
    NSLog(@"%d",[tracker retainCount]);
    [tracker retain];
    
    NSLog(@"%d",[tracker retainCount]);

    [tracker retain];
    
    NSLog(@"%d",[tracker retainCount]);

    
    [tracker release];
    
    NSLog(@"%d",[tracker retainCount]);
    [tracker release];
    
    NSLog(@"%d",[tracker retainCount]);


}

void test_tire1() {
    for(int i=0;i<4;i++) {
        AllWeatherRedial *tire;
        tire = [[ AllWeatherRedial alloc ] initWithPressure:30.0f threadDepth:45.0];
//        [tire setPressure: 20.0f];
//        [tire setThreadDepth: 30.0f];
        [tire setSnowHandling: 40.0f];
//        [tire setRainHandling: 50.0f];
//        [ car setTitle: tire atIndex:i];
        NSLog(@"tire:%@",tire);
        [ tire release];
    }
}

void test_category() {
    NSString *s=@"this is category";
    NSLog(@"%@'s length is %d and %d ",s,[s lengthAsNumber],[s length]);
}

void test_block() {
    int value = 6;
    int (^mul_block)(int number) = ^(int number) { return number * number ; };
    int result = mul_block(value);
    NSLog(@"result:%d",result);
    
}

void test_block2() {
    NSArray *array = [ NSArray arrayWithObjects:@"lijunjie",@"linian",@"jingyanli",@"mama", nil];
    
    NSLog(@"Unsorted Array %@",array);
    
    NSArray *sortArray = [array sortedArrayUsingComparator:^(NSString *obj1,NSString *obj2) {
        return [ obj1 compare: obj2];
    }];
    
    NSLog(@"Sorted Array %@",sortArray);
}


void test_block3() {
    typedef double (^mul_block_ref)(void);
    static double a=10,b=20;
    
    mul_block_ref mul = ^(void){return a*b ;};
    
    NSLog(@"%f * %f = %f ",a,b,mul());
    
    a= 30,b=40;
    NSLog(@"%f * %f = %f ",a,b,mul());

    typedef double (^mul_block_ref2)(double c,double d);
    
    mul_block_ref2 mul2 = ^(double c,double d) { return c * d; };
    NSLog(@"test1=%f,test2=%f",mul2(2,3),mul2(5,2));
    
}

void test_block4() {
    typedef double (^mul_block_ref3)(double c,double d,double e);
    __block double a;
    mul_block_ref3 mul4=^(double c,double d,double e) { a= c*d*e; return a;};
    a=mul4(3.0f,3.0f,1.0f);
    NSLog(@"%f %f %f %f",3.0f,3.0f,4.0f,a);
    
    
    
}
void test_category1() {
    CategoryThing *thing = [ [CategoryThing alloc] init];
    [thing setThing1: 12];
    [thing setThing2: 23];
    
    NSLog(@"Thing are %@",thing);
}
int main(int argc, const char * argv[]) {
//    BOOL areTheyDifferent;
//    areTheyDifferent = areIntsdifferent(5,5);
//    NSLog(@"are %d and %d different ?%@",5,5,boolString(areTheyDifferent));
//    areTheyDifferent = areIntsdifferent(5,23);
//    NSLog(@"are %d and %d different ?%@",5,23,boolString(areTheyDifferent));
    
//    test_for();
//    test_array();
//    test_file1();
//    test_class1();
//    test_car();
//    test_array3();
//    test_map1();
    @autoreleasepool
    {
//    test_retain();
//        test_tire1();
        
//        test_category1();
        test_block4();
    }
    
    return 0;
}
