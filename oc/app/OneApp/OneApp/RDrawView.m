//
//  RDrawView.m
//  OneApp
//
//  Created by lijunjie on 31/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RDrawView.h"
#import "RLine.h"


@interface RDrawView()

@property (nonatomic,strong) RLine *currentLine;
@property (nonatomic,strong) NSMutableArray *finishedLines;

@end
@implementation RDrawView

# pragma mark -init
-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.finishedLines = [[ NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        
    }
    
    return self;
}


# pragma mark -draw

-(void) strokeLine:(RLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    
    [bp stroke];
}

-(void) drawRect:(CGRect)rect {
    [[UIColor blackColor ]set];
    
    for(RLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    if(self.currentLine) {
        [[UIColor redColor] set];
        [self strokeLine:self.currentLine];
    }
}


-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint location = [t locationInView:self];
    self.currentLine = [[RLine alloc] init];
    self.currentLine.begin = location;
    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint loc = [t locationInView:self];
    self.currentLine.end = loc;
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.finishedLines addObject:self.currentLine];
    self.currentLine = nil;
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
