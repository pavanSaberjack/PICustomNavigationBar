//
//  PIViewController.m
//  CustomNavigationBar
//
//  Created by pavan on 1/31/13.
//  Copyright (c) 2013 pavan. All rights reserved.
//

#import "PIViewController.h"
#import "PICustomNavigationBar.h"

@interface PIViewController ()

@end

@implementation PIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PICustomNavigationBar * navBar = [[PICustomNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 50) forState:eLeftRightButton forTitle:nil forTitleColor:[UIColor clearColor]];
    [navBar leftNavButtonOnClick:^{
        NSLog(@"left button clicked");
    }];
    [navBar rightNavButtonOnClick:^{
        NSLog(@"right button clicked");
    }];
    [self.view addSubview:navBar];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
