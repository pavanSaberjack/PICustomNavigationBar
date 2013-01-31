//
//  PICustomNavigationBar.m
//  CustomNavigationBar
//
//  Created by pavan on 1/31/13.
//  Copyright (c) 2013 pavan. All rights reserved.
//

#import "PICustomNavigationBar.h"
#import "PICustomButton.h"

@interface PICustomNavigationBar()
{
    UIButton *notificationButton;
    
    UIColor * titleColor;
    
    NavigationBarButtonBlock _leftButtonClickedBlock;
    NavigationBarButtonBlock _rightButtonClickedBlock;
    
    
    PICustomButton *leftButton;
    PICustomButton *rightButton;
}
@property (nonatomic, strong) UIButton *notificationButton;
@end

@implementation PICustomNavigationBar
@synthesize notificationButton;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame forState:eNoButton forTitle:@"" forTitleColor:nil];
    return self;
}

- (id)initWithFrame:(CGRect)frame forState:(NavigationBarButtonState)state forTitle:(NSString *)titleStr forTitleColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, 320, 48);
        navButtonState = state;
        titleColor = color;
        titleText = titleStr;
        
//    http://www.masswerk.at/google60/ = titleStr;
        [self initializeUI];
    }
    return self;
}


#pragma mark - Private methods
- (void)initializeUI
{
    
    self.backgroundColor = [UIColor redColor];
    
#warning set Navigation bar background image
    
//  self.backgroundColor = [UIColor colorWithPatternImage:nil];

    
    UILabel *navTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 8, 200, 32)];
    [navTextLabel setBackgroundColor:[UIColor clearColor]];
    [navTextLabel setText:titleText];
    [navTextLabel setTextAlignment:UITextAlignmentCenter];
    // Set custom Font name
    [navTextLabel setFont:[UIFont fontWithName:@"Helvetica" size:18.0f]];
    [navTextLabel setTextColor:titleColor];
    [self addSubview:navTextLabel];
    
    
    switch (navButtonState) {
        case eNoButton:
        {
            break;
        }
        case eLeftButton:
        {
            [self createLeftButton];
            
            break;
        }
        case eRightButton:
        {
            [self createRightButton];
            
            break;
        }
        case eLeftRightButton:
        {
            [self createLeftButton];
            
            [self createRightButton];
            
            break;
        }
            
    }
    
    notificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [notificationButton setFrame:CGRectMake(170.0f, 10.0f, 21.0f, 21.0f)];

#warning Set Notification button image on nav bar
    [notificationButton setBackgroundImage:nil forState:UIControlStateNormal];
    [notificationButton addTarget:self action:@selector(notificationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:notificationButton];
    
    UILabel * notificationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f,-1.0f, 20.0f, 20.0f)];
    [notificationLabel setBackgroundColor:[UIColor clearColor]];
    [notificationLabel setTag:111];
    [notificationLabel setTextAlignment:NSTextAlignmentCenter];
    [notificationLabel setTextColor:[UIColor whiteColor]];
#warning Set Notification button label font on nav bar
    [notificationLabel setFont:[UIFont fontWithName:@"Helvetica" size:10.0f]];
    [notificationButton addSubview:notificationLabel];
    
    [self setOpaque:NO];
}

- (void)setNotificationButtonOrigin:(CGPoint)point
{
    CGRect buttonRect = notificationButton.frame;
    buttonRect.origin = point;
    
    [notificationButton setFrame:buttonRect];
}

- (void)setNotificationButtonText:(NSString *)text
{
    for (id subView in [notificationButton subviews]) {
        if ([subView isKindOfClass:[UILabel class]])
        {
            UILabel * lbl = (UILabel *)subView;
            if (lbl.tag == 111) {
                lbl.text = text;
            }
        }
    }
}

- (void)hideNotificationButton:(BOOL)value
{
    [notificationButton setHidden:value];
}

- (void)notificationButtonClicked:(UIButton *)sender
{
    if ([delegate respondsToSelector:@selector(notificationButtonClicked)]) {
        [delegate performSelector:@selector(notificationButtonClicked)];
    }
}

- (void)createLeftButton
{
    leftButton = [PICustomButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(6.0f, 6.0f, 52.0f, 33.0f)];
    [leftButton setBackgroundColor:[UIColor grayColor]];
    
#warning set left nav bar button image   
//    [leftButton setImage:nil forState:UIControlStateNormal];
//    [leftButton setImage:nil forState:UIControlStateHighlighted];
    
    [self addSubview:leftButton];
}

- (void)createRightButton
{
    rightButton = [PICustomButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(260.0f, 6.0f, 52.0f, 33.0f)];
    [rightButton setBackgroundColor:[UIColor grayColor]];
    
#warning set right nav bar button image
//    [rightButton setBackgroundImage:nil forState:UIControlStateNormal];
//    [rightButton setImage:nil forState:UIControlStateHighlighted];
    [self addSubview:rightButton];
}


- (void)leftNavButtonOnClick:(NavigationBarButtonBlock)buttonClickBlock
{
    _leftButtonClickedBlock = buttonClickBlock;
    [leftButton handleControlEvents:UIControlEventTouchUpInside forBlock:^{
        _leftButtonClickedBlock();
    }];
}

- (void)rightNavButtonOnClick:(NavigationBarButtonBlock)buttonClickBlock
{
    _rightButtonClickedBlock = buttonClickBlock;
    [rightButton handleControlEvents:UIControlEventTouchUpInside forBlock:^{
        _rightButtonClickedBlock();
    }];
}

@end

