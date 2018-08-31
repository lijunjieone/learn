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
@property (nonatomic,strong) RLine *selectLine;

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
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapRecognizer.delaysTouchesBegan = YES;
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        [self addGestureRecognizer:tapRecognizer];
        
        UILongPressGestureRecognizer *pressRecognizer = [[ UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        
        [self addGestureRecognizer:pressRecognizer];

        
    }
    
    return self;
}

-(RLine *) lineAtPoint:(CGPoint)p {
    for(RLine *line in self.finishedLines) {
        CGPoint start = line.begin;
        CGPoint end = line.end;
        
        for(float t=0.0;t<=1.0;t+=0.05) {
            float x = start.x + t *(end.x - start.x);
            float y = start.y + t * (end.y-start.y);
            if(hypot(x-p.x, y-p.y) < 20.0) {
                return line;
            }
        }
    }
    
    return nil;
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
    
    if(self.selectLine) {
        [[UIColor blueColor] set];
        [self strokeLine:self.selectLine];
        
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


-(void) longPress:(UIGestureRecognizer *) gr {
    if(gr.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [ gr locationInView:self];
        self.selectLine = [ self lineAtPoint:point];
        if(self.selectLine ) {
            [self.linesInProgress removeAllObjects];
        }
        
    }else if(gr.state == UIGestureRecognizerStateEnded){
        self.selectLine = nil;
    }
    
    [self setNeedsDisplay];
}
-(void) tap:(UIGestureRecognizer *) gr {
    CGPoint p = [gr locationInView:self];
    self.selectLine  = [self lineAtPoint:p];
    if(self.selectLine) {
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        menu.menuItems=@[deleteItem];
        
        [menu setTargetRect:CGRectMake(p.x,p.y,2,2) inView:self];
        [menu setMenuVisible:YES animated:YES];
    } else {
        [[UIMenuController sharedMenuController]setMenuVisible:NO animated:YES];
    }
    [self setNeedsDisplay];
}

-(BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) deleteLine:(id)sender {
    [self.finishedLines removeObject:self.selectLine];
    self.selectLine=nil;
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
