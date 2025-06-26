//
//  JHBaseAlertViewController.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2020/9/13.
//

#import "JHGrandPopupViewController.h"
#import "JHGrandPopupFadeInAnimation.h"
#import "JHGrandPopupFadeOutAnimation.h"

@interface JHGrandPopupViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *backView;
@property (nonatomic, readwrite, strong) UIView *contentView;

@end

@implementation JHGrandPopupViewController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _shouldDismissOnTouchBackView = NO;
        _inAnimator = [[JHGrandPopupFadeInAnimation alloc] init];
        _outAnimator = [[JHGrandPopupFadeOutAnimation alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    [self.view addSubview:self.backView];
    [self.view addSubview:self.contentView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.backView.frame = self.view.frame;
}

- (void)showIn:(UIViewController *)viewController completion:(void (^)(void))completion {
    [self showIn:viewController animated:YES completion:completion];
}

- (void)showIn:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    [self showIn:viewController isWrapInNavigationController:NO animated:animated completion:completion];
}

- (void)showIn:(UIViewController *)viewController isWrapInNavigationController:(BOOL)isWrap animated:(BOOL)animated completion:(void (^)(void))completion {
    UIViewController *presentedViewController = self;
    if (isWrap) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
        presentedViewController = nav;
    }
    presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    presentedViewController.transitioningDelegate = self;
    [viewController presentViewController:presentedViewController animated:animated completion:completion];
}

- (void)hiddenWithCompletion:(void (^)(void))completion {
    [self hiddenWithAnimated:YES completion:completion];
}

- (void)hiddenWithAnimated:(BOOL)animated completion:(void (^)(void))completion {
    [self dismissViewControllerAnimated:animated completion:completion];
}

#pragma mark- UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.inAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.outAnimator;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    UIPresentationController *controller = [[UIPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return controller;
}

- (void)backViewDidClicked:(id)sender {
    if (self.shouldDismissOnTouchBackView) {
        [self hiddenWithCompletion:self.onTouchBackViewActionBlk];
    } else if (self.onTouchBackViewActionBlk) {
        self.onTouchBackViewActionBlk();
    }
}

- (UIButton *)backView {
    if (_backView == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(backViewDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        _backView = btn;
    }
    return  _backView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

@end
