//
//  CTFrameParser.h
//  TestView
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTFrameParserConfig.h"
#import "CoreTextData.h"

@interface CTFrameParser : NSObject
+(CoreTextData *) parseContent:(NSString *) content config:(CTFrameParserConfig *) config;


@end
