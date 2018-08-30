//
//  RItem.h
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RItem : NSObject
{
    
    NSString * _itemName;
    NSString * _serialNumber;
    int _valueInDollars;
    
    NSDate * _dateCreated;
    
}

@property (nonatomic) NSString *  _itemName;
@property (nonatomic,readwrite) NSString * _serialNumber;
@property (nonatomic) int _valueInDollars;
@property (nonatomic) NSDate * _dateCreated;

+ (RItem *) randomItem;
- (NSString *) description;

@end
