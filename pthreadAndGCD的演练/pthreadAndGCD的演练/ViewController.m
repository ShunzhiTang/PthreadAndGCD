//
//  ViewController.m
//  pthreadAndGCD的演练
//
//  Created by Tsz on 15/11/26.
//  Copyright © 2015年 Tsz. All rights reserved.

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //p thread
//    [self testDemo];
    
    // NSThread
    [self threadDemo];
}


- (void)testDemo{
    
    pthread_t threadId = NULL;
    
    NSString *str = @"pthread  hahha";
    /**
     参数：
     1> 指向线程标识符的指针，C 语言中类型的结尾通常 _t/Ref，而且不需要使用 *
     2> 用来设置线程属性
     3> 线程运行函数的起始地址
     4> 运行函数的参数
     
     返回值：
     - 若线程创建成功，则返回0
     - 若线程创建失败，则返回出错编号
     */
    
    int result = pthread_create(&threadId , NULL , demo,(__bridge void *)(str));
    
    NSLog(@"%@" , [NSThread currentThread]);
    if (result == 0) {
        NSLog(@"ok");
    }else{
        NSLog(@"fail");
    }
}

void *demo(void *params){
    
    NSString *str = (__bridge NSString *)(params);
    
    NSLog(@"------pthread %@" , str);
    
    return NULL;
}

- (void)threadDemo{
    
    NSLog(@"before %@", [NSThread currentThread]);
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(login:) object:@"THREAD"];
    
    [thread start];
    
    NSLog(@"after %@", [NSThread currentThread]);
}

-(void)login:(NSString *)obj{
    
    NSLog(@"%@", obj);
}


@end
