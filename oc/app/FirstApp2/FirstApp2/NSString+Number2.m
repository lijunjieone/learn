//
//  NSString+Number2.m
//  FirstApp2
//
//  Created by lijunjie on 27/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "NSString+Number2.h"

@implementation NSString (Number2)
-(NSNumber * )lengthAsNumber
{
    NSUInteger len = [ self length ];
    return ([NSNumber numberWithUnsignedInt:len]);
}
@end
