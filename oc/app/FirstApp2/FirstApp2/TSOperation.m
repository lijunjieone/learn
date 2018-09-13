//
//  TSOperation.m
//  FirstApp2
//
//  Created by lijunjie on 10/09/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "TSOperation.h"

@interface TSOperation()
@property int ticketSurplusCount;
@end

@implementation TSOperation

-(void) useInvocationOperation {
    NSInvocationOperation *op = [[NSInvocationOperation alloc ] initWithTarget:self selector:@selector(task1) object:nil];
    [op start];
}

-(void) useBlockOperation {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<3;i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    }];
    
    [op start];
}

- (void)addOperationToQueue {
    
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2.创建操作
    // 使用 NSInvocationOperation 创建操作1
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
//
//    // 使用 NSInvocationOperation 创建操作2
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2) object:nil];
//
//    // 使用 NSBlockOperation 创建操作3
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op3 addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
//            NSLog(@"执行第2次操作，线程：%@", [NSThread currentThread]);

        }
    }];
    
    // 3.使用 addOperation: 添加所有操作到队列中
    [queue addOperation:op1]; // [op1 start]
    [queue addOperation:op2]; // [op2 start]
    [queue addOperation:op3]; // [op3 start]
    
    NSLog(@"test");
}


-(void) useBlockOperationAddExecutionBock {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<2;i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    }];
    
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"5---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"6---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"7---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"8---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    
   
    
    [op start];
}


- (void)setMaxConcurrentOperationCount {
    
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2.设置最大并发操作数
    queue.maxConcurrentOperationCount = 1; // 串行队列
    // queue.maxConcurrentOperationCount = 2; // 并发队列
    // queue.maxConcurrentOperationCount = 8; // 并发队列
    
    // 3.添加操作
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
}

-(void) testQueue {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^(){
//        [NSThread sleepForTimeInterval:2];
//        [NSThread currentThread:sleep(3)];
        NSLog(@"执行第1次操作，线程：%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^(){
        NSLog(@"执行第2次操作，线程：%@", [NSThread currentThread]);
    }];
    // operation1依赖于operation2
    [operation2 addDependency:operation1];
    
    [queue addOperation:operation1];
    [queue addOperation:operation2];

}

-(void) communication {
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [queue addOperationWithBlock:^{
        for(int i=0;i<2;i++) {
            NSLog(@"1----%@",[NSThread currentThread]);
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for(int i=0;i<2;i++) {
                NSLog(@"2---%@",[NSThread currentThread]);
            }
        }];
    }];
    
    
}

-(void) initTicketStatusNotSave {
    NSLog(@"currentThread--%@",[NSThread currentThread]);
    
    self.ticketSurplusCount=50;
    
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1;
    
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    queue2.maxConcurrentOperationCount = 1;
    
//    __weak typeof(self) weakSelf = self;
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^(void){
        //        [weakSelf saleTicketNotSafe];- (void)applicationWillTerminate:(UIApplication *)application {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        [ self saleTicketNotSafe];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketNotSafe];
    }];
    
    [queue2 addOperation:op2];
    [queue1 addOperation:op1];
    
}


-(void) saleTicketNotSafe {
    while(1) {
        if(self.ticketSurplusCount >0) {
            self.ticketSurplusCount --;
            NSLog(@"%@",[NSString stringWithFormat:@"remain %d window %@",self.ticketSurplusCount,[NSThread currentThread]]);
            
        }else {
            NSLog(@"there are nothing!");
            break;
        }
    }
}


-(void) task1 {
    for(int i=0;i<10;i++) {
//        [NSThread sleepForTimeInterval:2];
//        [NSThread detachNewThreadSelector:@selector(useInvocationOperation) toTarget:self withObject:nil];
        NSLog(@"1---%@",[NSThread currentThread]);
        
    }
}

-(void) task2 {
    for(int i=0;i<10;i++) {
//        [NSThread sleepForTimeInterval:2];
        //        [NSThread detachNewThreadSelector:@selector(useInvocationOperation) toTarget:self withObject:nil];
        NSLog(@"2---%@",[NSThread currentThread]);
        
    }
}
@end
