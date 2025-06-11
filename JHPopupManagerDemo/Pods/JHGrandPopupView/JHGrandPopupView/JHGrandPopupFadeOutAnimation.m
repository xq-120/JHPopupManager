//
//  JHGrandPopupFadeOutAnimation.m
//  JHGrandPopupView
//
//  Created by xuequan on 2024/11/14.
//

#import "JHGrandPopupFadeOutAnimation.h"

@implementation JHGrandPopupFadeOutAnimation

- (void)animateWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    popupView.alpha = 1;
    
    [UIView animateWithDuration:self.animateDuration animations:^{
        popupView.alpha = 0;
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
