//
//  JHGrandPopupBaseOutAnimation.m
//  JHGrandPopupView
//
//  Created by xuequan on 2024/11/14.
//

#import "JHGrandPopupBaseOutAnimation.h"

@implementation JHGrandPopupBaseOutAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        _animateDuration = 0.25;
    }
    return self;
}

- (void)animateWithPopupView:(JHGrandPopupView *)popupView completion:(void (^)(void))completion {
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animateDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
