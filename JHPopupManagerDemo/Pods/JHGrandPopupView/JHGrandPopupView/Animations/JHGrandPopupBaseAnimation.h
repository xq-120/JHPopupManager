//
//  JHGrandPopupBaseAnimation.h
//  JHGrandPopupView
//
//  Created by xuequan on 2024/4/5.
//

#import <Foundation/Foundation.h>
#import "JHGrandPopupView.h"
#import "JHGrandPopupViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHGrandPopupBaseAnimation : NSObject <JHGrandPopupViewAnimationProtocol, JHGrandPopupViewControllerAnimationProtocol>

@property (nonatomic, assign) NSTimeInterval animateInDuration;

@property (nonatomic, assign) NSTimeInterval animateOutDuration;

@property (nonatomic, assign) JHGrandPopupAnimateDirectionType directionType;

- (void)animateInWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)animateOutWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end

NS_ASSUME_NONNULL_END
