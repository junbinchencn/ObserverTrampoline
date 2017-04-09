//
//  RNMainThreadTrampoline.m
//  ObserverTrampoline
//
//  Created by junbin on 17/4/6.
//  Copyright © 2017年 junbinchen. All rights reserved.
//

#import "RNMainThreadTrampoline.h"

@implementation RNMainThreadTrampoline

- (id)initWithTarget:(id)target{
    if (self = [super init]) {
        self.target = target;
    }
    return self;
}

- (NSMethodSignature *) methodSignatureForSelector:(SEL)aSelector{

    return [self.target methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation setTarget:self.target];
    [anInvocation retainArguments];
    [anInvocation performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:NO];
}

@end
