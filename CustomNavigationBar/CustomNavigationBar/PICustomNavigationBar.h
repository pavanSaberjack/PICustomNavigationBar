//
//  PICustomNavigationBar.h
//  CustomNavigationBar
//
//  Created by pavan on 1/31/13.
//  Copyright (c) 2013 pavan. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning Set Custom Buttons needed
typedef NS_ENUM(NSUInteger, NavigationBarButtonState) {
    eNoButton,
    eLeftButton,
    eRightButton,
    eLeftRightButton
};

typedef void(^NavigationBarButtonBlock)();


@protocol ActNavigationBarDelegate <NSObject>

@optional
- (void)rightButtonClickedForState:(NavigationBarButtonState)state;
- (void)leftButtonClickedForState:(NavigationBarButtonState)state;
- (void)notificationButtonClicked;
@end

@interface PICustomNavigationBar : UIView
{
    NavigationBarButtonState navButtonState;
    NSString *titleText;
}

@property (nonatomic, weak) id<ActNavigationBarDelegate> delegate;

- (id)initWithFrame:(CGRect)frame forState:(NavigationBarButtonState)state forTitle:(NSString *)titleStr forTitleColor:(UIColor *)color;
- (void)setNotificationButtonOrigin:(CGPoint)point;
- (void)setNotificationButtonText:(NSString *)text;
- (void)hideNotificationButton:(BOOL)value;

- (void)leftNavButtonOnClick:(NavigationBarButtonBlock)buttonClickBlock;
- (void)rightNavButtonOnClick:(NavigationBarButtonBlock)buttonClickBlock;
@end