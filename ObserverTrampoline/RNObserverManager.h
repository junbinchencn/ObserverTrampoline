//
//  RNObserverManager.h
//  ObserverTrampoline
//
//  Created by junbin on 17/4/5.
//  Copyright © 2017年 junbinchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface RNObserverManager : NSObject

// 初始化的时候 需要一个协议和一组观察者
- (id)initWithProtocol:(Protocol *)protocol observers:(NSSet *)observers;
// 添加观察者
- (void)addObserver:(id)observer;
// 删除观察者
- (void)removeObserver:(id)observer;

@end
