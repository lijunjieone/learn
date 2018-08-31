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
@property (nonatomic,strong) NSMutableDictionary *linesInProgress;
//@property (nonatomic,strong) RLine *currentLine;
@property (nonatomic,strong) NSMutableArray *finishedLines;

@end
@implementation RDrawView

# pragma mark -init
-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.linesInProgress = [[ NSMutableDictionary alloc] init];
        self.finishedLines = [[ NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap2:)];
        
        doubleTapRecognizer.numberOfTapsRequired =2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognizer];
        
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
    [[UIColor redColor] set];

    for(NSValue *key in self.linesInProgress) {
        RLine *line = self.linesInProgress[key];
        [self strokeLine: line];
    }
    
}


# pragma mark -handle touch

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for(UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        RLine *currentLine = [[RLine alloc] init];
        currentLine.begin = location;
        currentLine.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = currentLine;
        
    }
//    UITouch *t = [touches anyObject];
   
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        RLine *currentLine = self.linesInProgress[key];
        CGPoint loc = [t locationInView:self];
        currentLine.end = loc;
    }
    [self setNeedsDisplay];

}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        RLine *currentLine = self.linesInProgress[key];
        [self.finishedLines addObject:currentLine];
        [self.linesInProgress removeObjectForKey:key];
    }
//    [self.finishedLines addObject:self.currentLine];
//    self.currentLine = nil;
    [self setNeedsDisplay];
}


-(void) doubleTap2:(UIGestureRecognizer *) gr {
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
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
