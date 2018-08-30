//
//  RHypnosisView.m
//  OneApp
//
//  Created by lijunjie on 29/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RHypnosisView.h"

@interface RHypnosisView()

@property (strong,nonatomic) UIColor *circleColor;
@end

@implementation RHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) setCircleColor:(UIColor *)color
{
    _circleColor=color;
    [self setNeedsDisplay];
    
}
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor=[UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
        
    }
    return (self);
}

- (void) drawOneCircle
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0f;
    center.y = bounds.origin.y + bounds.size.height/2.0f;
    
    float radius = (MIN(bounds.size.width,bounds.size.height)/2.0f);
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    
    [path addArcWithCenter:center radius:radius startAngle:0.0f endAngle:M_PI *2.0 clockwise:YES];
    
    path.lineWidth = 10;
    [path stroke];
    
}



- (void) drawMulCircle
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0f;
    center.y = bounds.origin.y + bounds.size.height/2.0f;
    
    float maxRadius = (hypot(bounds.size.width,bounds.size.height)/2.0f);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for(int currentRadius=maxRadius;currentRadius > 0 ; currentRadius -=20) {
        [ path moveToPoint:CGPointMake(center.x+currentRadius,center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0f endAngle:M_PI*2.0 clockwise:YES];
        path.lineWidth=5;
        [self.circleColor setStroke];
        [path stroke];
    }
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched",self);
    
    float red = (arc4random()%100)/100.0f;
    float green = (arc4random()%100)/100.0f;
    float blue = (arc4random()%100)/100.0f;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    self.circleColor = randomColor;
}
- (void)drawRect:(CGRect)rect
{
//    [ self drawOneCircle];
    [self drawMulCircle];
}

@end
