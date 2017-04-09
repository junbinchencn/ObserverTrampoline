//
//  ViewController.m
//  ObserverTrampoline
//
//  Created by junbin on 17/4/5.
//  Copyright © 2017年 junbinchen. All rights reserved.
//

#import "ViewController.h"
#import "RNObserverManager.h"
#import "RNMainThreadTrampoline.h"

// 观察者需要实现的协议
@protocol MyProtocol <NSObject>
- (void)doSomething;
@end

// 观察者
@interface MyClass : NSObject <MyProtocol>
@end

@implementation MyClass
// 观测者实现协议方法
- (void)doSomething{
    NSLog(@"doSomething :%@", self);
}
@end


@interface ViewController ()

// 使用 id 类型可以避免编译器警告
@property (nonatomic,strong) id observerManager;

//@property (nonatomic,strong) id mainThreadTrampoline;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 创建消息观察者
    NSSet  *observers = [NSSet setWithObjects:[MyClass new],[MyClass new], nil];
    // 创建 RNObserverManager 蹦床
    self.observerManager = [[RNObserverManager alloc]
                            initWithProtocol:@protocol(MyProtocol) observers:observers];
    // 给 RNObserverManager 发送 doSomething 消息，实际上都会被转发到 MyClass 的 doSomething 方法
    [self.observerManager doSomething];
    
    

//     self.mainThreadTrampoline = [[RNMainThreadTrampoline alloc] initWithTarget:[MyClass new]];
//     [self.mainThreadTrampoline doSomething];
    
    
//    self.mainThreadTrampoline = [[RNMainThreadTrampoline alloc] initWithTarget:[MyClass new]];
//    __weak typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [weakSelf.mainThreadTrampoline doSomething];
//
//    });
    
//  创建数组
//    NSMutableArray *array = [NSMutableArray array];
//    NSLog(@"array.count--->%ld",array.count);
////  创建一个 NSString 对象，该对象后面加入 array
//    NSString *stuff = @"Stuff";
////  获取 NSMutableArray 的 addObject: 方法签名
//    SEL selector = @selector(addObject:);
//    NSMethodSignature *signature = [array methodSignatureForSelector:selector];

//  创建 NSInvocation 对象
    //  使用方法签名
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//    // array 是接收消息的对象
//    [invocation setTarget:array];
//    // 被 invocation 发送的消息 selector
//    [invocation setSelector:selector];
//    // 默认 index = 0 位置的参数是 目标（self）， index = 1 位置的参数是 selector（_cmd）,从 index =2 开始才是第一个参数
//    [invocation setArgument:&stuff atIndex:2];
//    // 调用 NSInvocation
//    [invocation invoke];
//    
//    NSLog(@"array.count--->%ld",array.count);
    
//   array.count--->0
//   array.count--->1
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
