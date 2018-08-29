//
//  CTFrameParserConfig.m
//  TestView
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig
-(id) init {
    self = [super init];
    if(self) {
        _width = 200.0f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108,108,108);
    }
    
    return (self);
}
@end
