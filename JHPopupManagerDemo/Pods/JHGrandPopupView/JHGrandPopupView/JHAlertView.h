//
//  JHAlertView.h
//  JHGrandPopupView
//
//  Created by uzzi on 2025/7/10.
//

#import <JHGrandPopupView/JHGrandPopupView.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JHAlertViewButtonLayoutStyle) {
    JHAlertViewButtonLayoutStyleHorizon = 0,
    JHAlertViewButtonLayoutStyleVertical = 1,
};

@interface JHAlertView : JHGrandPopupView

@property (nonatomic, assign) CGFloat topMargin;

@property (nonatomic, assign) CGFloat titleContentMargin;

@property (nonatomic, assign) CGFloat contentBtnMargin;

@property (nonatomic, assign) CGFloat alertViewEdgeMargin;

@property (nonatomic, assign) CGFloat titleEdgeMargin;

@property (nonatomic, assign) CGFloat contentEdgeMargin;

@property (nonatomic, assign) CGFloat buttonEdgeMargin;

@property (nonatomic, assign) CGFloat buttonIntervalMargin;

@property (nonatomic, assign) CGFloat buttonHeight;

@property (nonatomic, assign) CGFloat minAlertHeight;

@property (nonatomic, assign) CGFloat bottomMargin;

@property (nonatomic, assign) JHAlertViewButtonLayoutStyle buttonLayoutStyle;

@property (nonatomic, assign) BOOL onlyShowLeftBtn;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIView *line1View;

@property (nonatomic, strong) UIView *line2View;

@property (nonatomic, copy, nullable) void(^leftActionBlk)(void);

@property (nonatomic, copy, nullable) void(^rightActionBlk)(void);

@end

NS_ASSUME_NONNULL_END
