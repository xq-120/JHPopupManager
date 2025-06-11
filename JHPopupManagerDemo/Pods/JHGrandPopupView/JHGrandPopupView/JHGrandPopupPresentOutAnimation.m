//
//  JHGrandPopupPresentOutAnimation.m
//  JHGrandPopupView
//
//  Created by xuequan on 2024/11/14.
//

#import "JHGrandPopupPresentOutAnimation.h"
#import "JHGrandPopupViewController.h"

@implementation JHGrandPopupPresentOutAnimation

- (void)animateWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    CGRect toFrame = popupView.contentView.frame;
    toFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height;

    [UIView animateWithDuration:self.animateDuration animations:^{
        popupView.alpha = 0;
        popupView.contentView.frame = toFrame;
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
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
    
    CGRect contentViewFrame = contentVC.contentView.frame;
    contentVC.backView.alpha = 1;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        contentVC.backView.alpha = 0;
        contentVC.contentView.frame = CGRectMake(contentViewFrame.origin.x, contentViewFrame.origin.y + contentViewFrame.size.height, contentViewFrame.size.width, contentViewFrame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
