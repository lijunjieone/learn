//
//  CoreTextData.m
//  TestView
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData
- (void) setCtFrame:(CTFrameRef)ctFrame
{
    if(_ctFrame != ctFrame) {
        if(_ctFrame != nil) {
            CFRelease(_ctFrame);
        }
        
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}

-(void) dealloc
{
    if(_ctFrame != nil) {
        CFRelease(_ctFrame);
        _ctFrame = nil;
    }
}

@end
