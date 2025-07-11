//
//  JHBaseAlertViewController.h
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2020/9/13.
//

#import <UIKit/UIKit.h>
#import "JHGrandPopupEnumDefine.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JHGrandPopupViewControllerAnimationProtocol <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) JHGrandPopupAnimateDirectionType directionType;

@end

// 弹窗为UIViewController
@interface JHGrandPopupViewController : UIViewController

@property (nonatomic, weak, nullable) UIViewController *inViewController;

@property (nonatomic, strong, readonly) UIView *backView;

@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, copy) void (^ _Nullable onTouchBackViewActionBlk)(void);

/// 子类的所有子视图建议都添加在contentView上。
/// 在设置从左到右，从上到下的约束后，contentView的size是自适应的。
@property (nonatomic, readonly, strong) UIView * _Nonnull contentView;

/// 弹窗动画。默认为Fade,可自定义。
@property (nonatomic, strong) id<JHGrandPopupViewControllerAnimationProtocol> animator;

- (instancetype)init;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

/// animated:YES
- (void)showIn:(UIViewController *)viewController completion:(void (^ _Nullable)(void))completion;

- (void)showIn:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

/// 在指定viewController上弹出弹窗。
/// - Parameters:
///   - viewController: presenting viewController
///   - isWrap:弹窗控制器是否包裹在Navigation Controller里
///   - animated: 是否动画
///   - completion: 显示完成回调
- (void)showIn:(UIViewController *)viewController 
isWrapInNavigationController:(BOOL)isWrap
      animated:(BOOL)animated
    completion:(void (^ _Nullable)(void))completion;

/// animated:YES
- (void)hiddenWithCompletion:(void (^ _Nullable)(void))completion;

/// 关闭弹窗
/// - Parameters:
///   - animated: 是否动画
///   - completion: 关闭完成回调
- (void)hiddenWithAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
