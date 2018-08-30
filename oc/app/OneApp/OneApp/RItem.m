//
//  RItem.m
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RItem.h"

@implementation RItem

@synthesize _itemName;
@synthesize  _serialNumber;
@synthesize  _valueInDollars;
@synthesize _dateCreated;


+ (RItem *) randomItem {
//    RItem *item = [[RItem alloc] init ];
//    return item;
    
    RItem *item = [[RItem alloc] init];
    [item set_itemName:@"Red Sofa"];
    [item set_serialNumber:@"A1B2C"];
    [item set_valueInDollars:1000];
    [item set_dateCreated:[[NSData alloc]init]];
    
    return item;
}

- (NSString *) description {
   
    NSString *desc = [self _itemName];
    
    return desc;
}

@end
