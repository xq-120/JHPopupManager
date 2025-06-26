//
//  JHGrandPopupView.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2022/7/15.
//

#import "JHGrandPopupView.h"
#import "JHGrandPopupFadeInAnimation.h"
#import "JHGrandPopupFadeOutAnimation.h"

@interface JHGrandPopupView ()

@property (nonatomic, strong) UIButton *backView;
@property (nonatomic, readwrite, strong) UIView * _Nonnull contentView;

@end

@implementation JHGrandPopupView

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)_commonInit {
    self.inAnimator = JHGrandPopupFadeInAnimation.new;
    self.outAnimator = JHGrandPopupFadeOutAnimation.new;
    
    self.backgroundColor = [UIColor clearColor];
    _shouldDismissOnTouchBackView = NO;
    self.backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [self addSubview:self.backView];
    [self addSubview:self.contentView];
    
    self.backView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = true;
}

- (void)showWithCompletion:(void (^)(void))completion {
    [self showIn:nil completion:completion];
}

- (void)showIn:(UIView *)view completion:(void (^)(void))completion {
    [self showIn:view animated:YES completion:completion];
}

- (void)showIn:(UIView *)view animated:(BOOL)animated completion:(void (^)(void))completion {
    if (view == nil) {
        view = UIApplication.sharedApplication.delegate.window;
    }
    if (CGRectEqualToRect(self.frame, CGRectZero)) {
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    }
    [view addSubview:self];
    
    if (!animated) {
        completion == nil ? nil : completion();
        return;
    }
    [self.inAnimator animateWithPopupView:self completion:completion];
}

- (void)hiddenWithCompletion:(void (^)(void))completion {
    [self hiddenWithAnimated:YES completion:completion];
}

- (void)hiddenWithAnimated:(BOOL)animated completion:(void (^)(void))completion {
    if (!animated) {
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
        return;
    }
    [self.outAnimator animateWithPopupView:self completion:^{
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
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
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.backgroundColor = UIColor.whiteColor;
    }
    return _contentView;
}

@end
