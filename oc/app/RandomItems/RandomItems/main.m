//
//  main.m
//  RandomItems
//
//  Created by lijunjie on 29/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RItem.h"

void handleArray() {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    [items addObject:@"one"];
    [items addObject:@"two"];
    [items addObject:@"three"];
    [items insertObject:@"Zero" atIndex:0];
    

    for(int i=0;i<[items count];i++) {
        NSString *item = [items objectAtIndex:i];
        NSLog(@"pos:%d,value:%@",i,item);

    }
    
    id lastObj = [items lastObject];
    [lastObj count];
    
    items = nil;

}

void handleRItem() {
    RItem *item = [RItem alloc];
    [item init];
    [item set_itemName:@"Red Sofa"];
    [item set_serialNumber:@"A1B2C"];
    [item set_valueInDollars:1000];
    [item set_dateCreated:[[NSData alloc]init]];
    
    NSLog(@"%@ %@ %@ %d",[item _itemName],[item _serialNumber],[item _dateCreated],[item _valueInDollars]);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        handleArray();
        
        handleRItem();
        
    }
    return 0;
}
