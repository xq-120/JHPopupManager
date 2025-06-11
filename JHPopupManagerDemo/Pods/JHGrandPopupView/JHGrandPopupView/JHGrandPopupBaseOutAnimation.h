//
//  JHGrandPopupBaseOutAnimation.h
//  JHGrandPopupView
//
//  Created by xuequan on 2024/11/14.
//

#import <Foundation/Foundation.h>
#import "JHGrandPopupView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHGrandPopupBaseOutAnimation : NSObject <JHGrandPopupAnimationProtocol, UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval animateDuration;

@end

NS_ASSUME_NONNULL_END
