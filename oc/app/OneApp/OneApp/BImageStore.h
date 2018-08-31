//
//  BImageStore.h
//  OneApp
//
//  Created by lijunjie on 31/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BImageStore : NSObject
+(id) sharedStore;
-(void) setImage:(UIImage *) image forKey:(NSString *) key;
-(UIImage *) imageForKey:(NSString *)key;
-(void) deleteImageForKey:(NSString *) key;

@end
