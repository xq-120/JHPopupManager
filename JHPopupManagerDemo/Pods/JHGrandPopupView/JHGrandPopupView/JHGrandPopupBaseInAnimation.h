//
//  JHGrandPopupBaseAnimation.h
//  JHGrandPopupView
//
//  Created by xuequan on 2024/4/5.
//

#import <Foundation/Foundation.h>
#import "JHGrandPopupView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHGrandPopupBaseInAnimation : NSObject <JHGrandPopupAnimationProtocol, UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval animateDuration;


@end

NS_ASSUME_NONNULL_END
