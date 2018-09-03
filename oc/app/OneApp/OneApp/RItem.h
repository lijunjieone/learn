//
//  RItem.h
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RItem : NSObject<NSCopying>


@property (nonatomic) NSString *  _itemName;
@property (nonatomic,readwrite) NSString * _serialNumber;
@property (nonatomic) int _valueInDollars;
@property (nonatomic,readonly,strong) NSDate * _dateCreated;
@property (nonatomic,copy) NSString *itemKey;

+ (RItem *) randomItem;
- (NSString *) description;

@end
