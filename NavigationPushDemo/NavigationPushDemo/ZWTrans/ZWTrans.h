//
//  ZWTrans.h
//  NavigationPushDemo
//
//  Created by yrc on 2018/4/11.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef enum {
    push = 0,
    pop
}tranType;


@interface ZWTrans : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)transType:(tranType)type;

@end
