//
//  ZWInteractiveTransition.h
//  NavigationPushDemo
//
//  Created by yrc on 2018/4/11.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)(void);

typedef NS_ENUM(NSUInteger, ZWInteractiveTransitionGestureDirection) {//手势的方向
    ZWInteractiveTransitionGestureDirectionLeft = 0,
    ZWInteractiveTransitionGestureDirectionRight,
    ZWInteractiveTransitionGestureDirectionUp,
    ZWInteractiveTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, ZWInteractiveTransitionType) {//手势控制哪种转场
    ZWInteractiveTransitionTypePresent = 0,
    ZWInteractiveTransitionTypeDismiss,
    ZWInteractiveTransitionTypePush,
    ZWInteractiveTransitionTypePop,
};

@interface ZWInteractiveTransition : UIPercentDrivenInteractiveTransition


/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;


//初始化方法

+ (instancetype)interactiveTransitionTransitionType:(ZWInteractiveTransitionType)type GestureDirection:(ZWInteractiveTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(ZWInteractiveTransitionType)type GestureDirection:(ZWInteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
