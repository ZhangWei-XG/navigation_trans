//
//  ToViewController.m
//  NavigationPushDemo
//
//  Created by yrc on 2018/4/11.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ToViewController.h"

#import "ZWTrans.h"
#import "ZWInteractiveTransition.h"

@interface ToViewController ()

@property(strong,nonatomic) UIPercentDrivenInteractiveTransition *interactiveTransition;
@property(strong,nonatomic) UIScreenEdgePanGestureRecognizer *pan;

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"ToVC";

    self.imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"WechatIMG424.jpeg"]];
    self.imgView.frame = CGRectMake(37.5, 94, 300, 250);
    [self.view addSubview:self.imgView];
    
    // 手势
    self.pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlEdgeScreenPanGesture:)];
    self.pan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handlEdgeScreenPanGesture:(UIScreenEdgePanGestureRecognizer *)sender{
    
    CGFloat progress = [sender translationInView:self.view].x/self.view.bounds.size.width;
    NSLog(@"### %f %s(%d) " ,progress, __PRETTY_FUNCTION__, __LINE__);
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            [self.interactiveTransition updateInteractiveTransition:progress];
            break;
            
        case UIGestureRecognizerStateEnded:
            
            
            
        case UIGestureRecognizerStateCancelled:
        {
            if(progress >=0.5){
                [self.interactiveTransition finishInteractiveTransition];
            }
            else{
                [self.interactiveTransition cancelInteractiveTransition];
            }
        }
            
            break;
        default:
            break;
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if(operation == UINavigationControllerOperationPush){
        return   [ZWTrans transType:push];
    }else{
        return [ZWTrans transType:pop];
    }
    
}
//手势
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    return self.interactiveTransition;
}

@end
