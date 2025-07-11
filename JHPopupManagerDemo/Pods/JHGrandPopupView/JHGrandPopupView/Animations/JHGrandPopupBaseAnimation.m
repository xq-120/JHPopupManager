//
//  JHGrandPopupBaseAnimation.m
//  JHGrandPopupView
//
//  Created by xuequan on 2024/4/5.
//

#import "JHGrandPopupBaseAnimation.h"

@implementation JHGrandPopupBaseAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        _animateInDuration = 0.25;
        _animateOutDuration = 0.25;
    }
    return self;
}

- (void)animateInWithPopupView:(JHGrandPopupView *)popupView completion:(void (^)(void))completion {
    
}

- (void)animateOutWithPopupView:(JHGrandPopupView *)popupView completion:(void (^)(void))completion {
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.directionType == JHGrandPopupAnimateDirectionIn) {
        return self.animateInDuration;
    }
    return self.animateOutDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.directionType == JHGrandPopupAnimateDirectionIn) {
        [self animateInWithTransitionContext:transitionContext];
    } else {
        [self animateOutWithTransitionContext:transitionContext];
    }
}

- (void)animateInWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)animateOutWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
