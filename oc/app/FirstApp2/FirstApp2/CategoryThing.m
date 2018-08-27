//
//  CategoryThing.m
//  FirstApp2
//
//  Created by lijunjie on 27/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "CategoryThing.h"

@implementation CategoryThing
- (NSString *) description
{
    NSString *desc;
    desc = [ NSString stringWithFormat:@"%d %d",thing1,thing2];
    return (desc);
}
@end
