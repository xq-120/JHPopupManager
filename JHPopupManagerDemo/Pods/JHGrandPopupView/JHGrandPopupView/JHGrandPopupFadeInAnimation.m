//
//  JHGrandPopupFadeAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2022/7/16.
//

#import "JHGrandPopupFadeInAnimation.h"
#import <UIKit/UIKit.h>

@implementation JHGrandPopupFadeInAnimation

- (void)animateWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    popupView.alpha = 0;
    
    [UIView animateWithDuration:self.animateDuration animations:^{
        popupView.alpha = 1;
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = finalFrame;
    toVC.view.alpha = 0;
    
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
