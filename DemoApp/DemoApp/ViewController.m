//
//  ViewController.m
//  DemoApp
//
//  Created by Toshikazu Fukuoka on 2014/05/27.
//  Copyright (c) 2014年 Toshikazu Fukuoka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButtonAction:(id)sender
{
    [[TRACustomUIWindow sharedInstance] showWindow];
    [[TRACustomUIWindow sharedInstance] setDelegate:self];
//    [[TRACustomUIWindow sharedInstance] setEnableBaseViewTouch:NO];
}

#pragma mark -
#pragma mark TRACustomUIWindowDelegate
- (void)buttonTapEventHandle
{
    // For example, use hideWindow.
    // Please mount other actions when necessary.
    [[TRACustomUIWindow sharedInstance] hideWindow];
}
@end
