//
//  CTDisplayView.m
//  TestView
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "CTDisplayView.h"
# import "CoreText/CoreText.h"
# import "UIView+frameAdjust.h"
# import "CTFrameParser.h"

@implementation CTDisplayView
- (void) drawRect:(CGRect)rect
{
//    [super drawRect:rect];
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetTextMatrix(context,CGAffineTransformIdentity);
//    CGContextTranslateCTM(context,0,self.bounds.size.height);
//    CGContextScaleCTM(context,1.0,-1.0);
////
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path,NULL,self.bounds);
//
//
//
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World2!"
//                                     "CGContextReUIGraphicsGetCurrentContext"
//                                     "CGContextSetTextMatrixcontext,CGAffineTransformIdentity;"];
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) attString);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0,[attString length]),path,NULL);
//
//
//    CTFrameDraw(frame,context);
//
//    CFRelease(frame);
//    CFRelease(path);
//    CFRelease(framesetter);
    
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc ] init ];
    config.textColor = [UIColor redColor];
    config.width = self.width;
    
    CoreTextData *data = [CTFrameParser parseContent:@"test1111111111111111111111111""ssssss" config:config];
    
    self.data = data;
    self.height = data.height;
    self.backgroundColor = [UIColor yellowColor];
    
    if(self.data) {
        CTFrameDraw(self.data.ctFrame, context);
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
