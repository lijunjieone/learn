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

-(id) initWithCoder:(NSCoder *) aDecoder {
    self = [super init];
    if(self) {
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
        _dateCreated = [ aDecoder decodeObjectForKey:@"dateCreated"];
        _itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
        _valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
    }
    
    return (self);
    
}

-(id) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *) sNumber {
    self = [super init];
    if(self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = _serialNumber;
        
        _dateCreated = [[NSDate alloc] init];
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    return (self);
}


+ (RItem *) randomItem {
//    RItem *item = [[RItem alloc] init ];
//    return item;
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    RItem *item = [[RItem alloc] init];
    [item set_itemName:[NSString stringWithFormat:@"sofo%@",key]];
    [item set_serialNumber:@"A1B2C"];
    [item set_valueInDollars:1000];
//    item._dateCreated = [[NSDate alloc] init];
    
    item.itemKey = key;
//    [item set_dateCreated:[[NSData alloc]init]];
    
    return item;
}

- (NSString *) description {
   
    NSString *desc = [self _itemName];
    
    return desc;
}


- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self._itemName forKey:@"itemName"];
    [aCoder encodeObject:self._serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self._dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
    [aCoder encodeInt:self._valueInDollars forKey:@"valueInDollars"];
}


@end
