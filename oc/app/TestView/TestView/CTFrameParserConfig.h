//
//  CTFrameParserConfig.h
//  TestView
//
//  Created by lijunjie on 28/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>



#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]
@interface CTFrameParserConfig : NSObject

@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat fontSize;
@property (nonatomic,assign) CGFloat lineSpace;
@property (nonatomic,strong) UIColor *textColor;


@end
