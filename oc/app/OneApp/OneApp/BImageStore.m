//
//  BImageStore.m
//  OneApp
//
//  Created by lijunjie on 31/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "BImageStore.h"

@interface BImageStore()

@property (nonatomic,strong) NSMutableDictionary *dict;
@end
@implementation BImageStore

+(id) sharedStore {
    static BImageStore *sharedStore = nil;
    if(!sharedStore) {
        sharedStore = [[ self alloc] initPrivate];
        
    }
    return sharedStore;
}

-(id) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use [BImageStore sharedStore] replace" userInfo:nil];
    
}

-(id) initPrivate {
    self = [super init];
    if(self) {
        _dict  = [[NSMutableDictionary alloc ] init];
        
    }
    
    return self;
}

-(void ) setImage:(UIImage *) image forKey:(NSString *)key {
    [self.dict setObject:image forKey:key];
    
}

-(UIImage *) imageForKey:(NSString *)key {
    return [self.dict objectForKey:key];
}

-(void) deleteImageForKey:(NSString *)key {
    if(!key) {
        return;
    }
    [self.dict removeObjectForKey:key];
}


@end
