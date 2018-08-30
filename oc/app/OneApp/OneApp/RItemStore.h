//
//  RItemStore.h
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RItem;


@interface RItemStore : NSObject

@property (nonatomic,readonly) NSArray *allItems;
+(id) sharedStore;

-(RItem *) createItem;

@end
