//
//  TSOperation.h
//  FirstApp2
//
//  Created by lijunjie on 10/09/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSOperation : NSObject
-(void) useInvocationOperation;
-(void) useBlockOperation;
-(void) useBlockOperationAddExecutionBock ;
-(void) addOperationToQueue ;
-(void) setMaxConcurrentOperationCount;
-(void) testQueue;
-(void) initTicketStatusNotSave;
@end
