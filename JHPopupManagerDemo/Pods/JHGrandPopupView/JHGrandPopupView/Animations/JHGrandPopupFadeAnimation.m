//
//  JHGrandPopupFadeAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2022/7/16.
//

#import "JHGrandPopupFadeAnimation.h"
#import <UIKit/UIKit.h>

@implementation JHGrandPopupFadeAnimation

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    popupView.alpha = 0;
    if (!self.disableAnimateInZoom) {
        popupView.contentView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
    }
    [UIView animateWithDuration:self.animateInDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        popupView.alpha = 1;
        if (!self.disableAnimateInZoom) {
            popupView.contentView.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    popupView.alpha = 1;
    if (!self.disableAnimateOutZoom) {
        popupView.contentView.transform = CGAffineTransformIdentity;
    }
    [UIView animateWithDuration:self.animateOutDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        popupView.alpha = 0;
        if (!self.disableAnimateOutZoom) {
            popupView.contentView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
        }
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateInWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    JHGrandPopupViewController *contentVC = nil;
    if ([toVC isKindOfClass:JHGrandPopupViewController.class]) {
        contentVC = (JHGrandPopupViewController *)toVC;
    } else if ([toVC isKindOfClass:UINavigationController.class]) {
        contentVC = [(UINavigationController *)toVC viewControllers].firstObject;
    }
    if (![contentVC isKindOfClass:JHGrandPopupViewController.class]) {
        return;
    }
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    UIView *containerView = transitionContext.containerView;
    
    toVC.view.frame = finalFrame;
    toVC.view.alpha = 0;
    
    [containerView addSubview:toVC.view];
    
    [contentVC.view layoutIfNeeded];
    if (!self.disableAnimateInZoom) {
        contentVC.contentView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1;
        if (!self.disableAnimateInZoom) {
            contentVC.contentView.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (void)animateOutWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JHGrandPopupViewController *contentVC = nil;
    if ([fromVC isKindOfClass:JHGrandPopupViewController.class]) {
        contentVC = (JHGrandPopupViewController *)fromVC;
    } else if ([fromVC isKindOfClass:UINavigationController.class]) {
        contentVC = [(UINavigationController *)fromVC viewControllers].firstObject;
    }
    if (![contentVC isKindOfClass:JHGrandPopupViewController.class]) {
        return;
    }
    
    fromVC.view.alpha = 1;
    if (!self.disableAnimateOutZoom) {
        contentVC.contentView.transform = CGAffineTransformIdentity;
    }

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.alpha = 0;
        if (!self.disableAnimateOutZoom) {
            contentVC.contentView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
