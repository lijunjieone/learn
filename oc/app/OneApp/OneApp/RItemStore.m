//
//  RItemStore.m
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RItemStore.h"
#import "RItem.h"

@interface RItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation RItemStore

+(id) sharedStore {
    static RItemStore *sharedStore = nil;
    
//    if(!sharedStore) {
//        sharedStore = [[ self alloc ] initPrivate ];
//    }
    
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        sharedStore = [[ self alloc ] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[sharedStore]" userInfo:nil];
    return nil;
}

- (id) initPrivate {
    self = [ super init ];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems {
//    NSUInteger count = [ self.privateItems count];
    return [ self.privateItems copy];
}

- (RItem *) createItem {
    RItem *item = [RItem randomItem];
    [self.privateItems addObject:item];
    return item;
    
}

-(void) removeItem:(RItem *) item;
{
    [self.privateItems removeObjectIdenticalTo:item];
}


# pragma mark store data
-(NSString *) itemArchivePath {
    NSArray * documentDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString * documentDir = [documentDirs firstObject];
    return [ documentDir stringByAppendingPathComponent:@"item.archive"];
    
}

-(BOOL) saveChanges {

    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}
@end
