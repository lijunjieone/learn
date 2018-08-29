//
//  CoreTextData.h
//  TestView
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
# import "CTFrameParserConfig.h"

@interface CoreTextData : NSObject
@property (assign,nonatomic) CTFrameRef ctFrame;
@property (assign,nonatomic) CGFloat height;

@end
