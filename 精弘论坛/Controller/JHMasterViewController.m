//
//  JHMasterViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/14/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHMasterViewController.h"
#import "JHUserDefaults.h"
#import "JHLoginViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"

#import "JHLeftViewController.h"
#import "JHRightViewController.h"
#import "JHCenterViewController.h"


static const CGFloat kPublicLeftMenuWidth = 160.0f;
static const CGFloat kPublicRightMenuWidth = 240.0f;

@interface JHMasterViewController ()

@end

@implementation JHMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setThreeViews];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self login];
    [super viewWillAppear:NO];
}

-(void)login
{
    if ([[JHUserDefaults getLoginState]boolValue] == NO) {
        JHLoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"JHLoginViewController"];
        [self presentViewController:loginVC animated:NO completion:^{
        }];
    }
}

-(void)setThreeViews
{
    JHLeftViewController *leftView = [self.storyboard instantiateViewControllerWithIdentifier:@"JHLeftViewController"];
    JHCenterViewController *centerView = [self.storyboard instantiateViewControllerWithIdentifier:@"JHCenterViewController"];
    JHRightViewController *rightView = [self.storyboard instantiateViewControllerWithIdentifier:@"JHRightViewController"];
    
    self.leftDrawerViewController = leftView;
    self.centerViewController = centerView;
    self.rightDrawerViewController = rightView;
    
    [self setMaximumLeftDrawerWidth:kPublicLeftMenuWidth];
    [self setMaximumLeftDrawerWidth:kPublicRightMenuWidth];
    
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [self setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:2.0];
        block(drawerController, drawerSide, percentVisible);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
