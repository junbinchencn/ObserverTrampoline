//
//  RNMainThreadTrampoline.h
//  ObserverTrampoline
//
//  Created by junbin on 17/4/6.
//  Copyright © 2017年 junbinchen. All rights reserved.
//

#import <Foundation/Foundation.h>
// 创建一个把所有消息转发给主线程的代理蹦床
@interface RNMainThreadTrampoline : NSObject
@property (nonatomic,strong) id target;
- (id)initWithTarget:(id)target;
@end
