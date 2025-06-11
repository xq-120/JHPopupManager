//
//  JHGrandPopupPresentAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2022/7/16.
//

#import "JHGrandPopupPresentInAnimation.h"
#import "JHGrandPopupViewController.h"

@implementation JHGrandPopupPresentInAnimation

- (void)animateWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    [popupView layoutIfNeeded];
    
    CGRect fromFrame = popupView.contentView.frame;
    fromFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height;
    popupView.contentView.frame = fromFrame;
    
    CGRect toFrame = popupView.contentView.frame;
    toFrame.origin.y = popupView.frame.size.height - popupView.contentView.frame.size.height;
    
    popupView.alpha = 0;

    [UIView animateWithDuration:self.animateDuration animations:^{
        popupView.alpha = 1;
        popupView.contentView.frame = toFrame;
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
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
    toVC.view.frame = finalFrame;
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toVC.view];
    
    [contentVC.view layoutIfNeeded];
    CGRect contentViewFrame = contentVC.contentView.frame;
    contentVC.contentView.frame = CGRectMake(contentViewFrame.origin.x, contentViewFrame.origin.y + contentViewFrame.size.height, contentViewFrame.size.width, contentViewFrame.size.height);
    contentVC.backView.alpha = 0;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        contentVC.backView.alpha = 1;
        contentVC.contentView.frame = contentViewFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
