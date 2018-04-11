//
//  ZWTrans.m
//  NavigationPushDemo
//
//  Created by yrc on 2018/4/11.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZWTrans.h"

#import "FromViewController.h"
#import "ToViewController.h"

@interface ZWTrans()

/** 跳转类型 */
@property (nonatomic, assign) tranType   type;

@end

@implementation ZWTrans

+ (instancetype)transType:(tranType)type{
    return [[self alloc]initWithType:type];
}

- (instancetype)initWithType:(tranType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    if (_type == push) {
        [self pushMathor:transitionContext];
    }else{
        [self popMathor:transitionContext];
    }
}


- (void)pushMathor:(id<UIViewControllerContextTransitioning>)transitionContext{
    //1 fromvc tovc
    FromViewController *fromVC  =[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ToViewController      *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //2 containView
    UIView *containview = [transitionContext containerView];
    
    
    //3 addsubView
    UIView *tempview = [fromVC.imgView snapshotViewAfterScreenUpdates:NO];
    tempview.frame = fromVC.imgView.frame;
    fromVC.imgView.hidden = YES;
    toVC.imgView.hidden = YES;
    
    [containview addSubview:toVC.view];
    [containview addSubview:tempview];
    toVC.view.alpha = 0;
    
    //4 animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        tempview.frame = toVC.imgView.frame;
        
    }completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        toVC.view.alpha = 1;
        fromVC.imgView.hidden = NO;
        toVC.imgView.hidden = NO;
        [tempview removeFromSuperview];
    }];

}


- (void)popMathor:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // from  to  VC 互换方向
    ToViewController     *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FromViewController   *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *tempView      = [fromVC.imgView snapshotViewAfterScreenUpdates:NO];
    
    tempView.frame = fromVC.imgView.frame;
    fromVC.imgView.hidden = YES;
    toVC.imgView.hidden = YES;
    toVC.view .alpha  = 0;

    [containerView addSubview:tempView];
    [containerView addSubview:toVC.view];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
        tempView.frame =  toVC.imgView.frame;

    }completion:^(BOOL finished) {
       
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        if([transitionContext transitionWasCancelled]){
            fromVC.imgView.hidden = NO;
            [tempView removeFromSuperview];
            
        }else{
            toVC.imgView.hidden = NO;
            toVC.view.alpha = 1;
            [tempView removeFromSuperview];
        }
        
    }];
}

@end
