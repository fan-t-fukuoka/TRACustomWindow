//
//  TRACustomUIWindow.m
//  TRACustomWindow
//
//  Created by Toshikazu Fukuoka on 2014/05/27.
//  Copyright (c) 2014年 Toshikazu Fukuoka. All rights reserved.
//

#import "TRACustomUIWindow.h"

#define CATransform3DMakeScale_SHOW_INIT CATransform3DMakeScale(1.3f, 1.3f, 1.0f);
#define CATransform3DMakeScale_SHOW_ANIM CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
#define CATransform3DMakeScale_HIDE_ANIM CATransform3DMakeScale(0.5f, 0.5f, 0.5f);
#define OPACITY_SUBVIEW_SHOW_INIT 0.5f
#define OPACITY_SUBVIEW_SHOW_ANIM 1.0f
#define OPACITY_SUBVIEW_HIDE_ANIM 0.0f

#define BASEVIEW_TAG 1

/***************************************
  Please add subViews tag as necessary.
 ***************************************/
#define SUBVIEW1_TAG 2
#define SUBVIEW2_TAG 3

@implementation TRACustomUIWindow

static UIWindow *_mainWindow;

+ (TRACustomUIWindow *)sharedInstance
{
    static TRACustomUIWindow *theTRACustomUIWindow;
    @synchronized(self) {
        if (!theTRACustomUIWindow)
            theTRACustomUIWindow = [[self alloc] init];
    }
    return theTRACustomUIWindow;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _enableBaseViewTouch = YES;
    }
    return self;
}


- (void)showWindow
{
    
    if (_mainWindow == nil) {
        
        // Make UIWindow
        _mainWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _mainWindow.windowLevel = UIWindowLevelNormal + 1.0f;
        _mainWindow.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.0f];
        [_mainWindow makeKeyAndVisible];
        
        // Make TRACustomBaseView
        TRACustomBaseView *baseView = [[TRACustomBaseView alloc] initWithFrame:_mainWindow.frame];
        baseView.center = _mainWindow.center;
        baseView.backgroundColor = [UIColor clearColor];
        baseView.delegate = self;
        baseView.tag = BASEVIEW_TAG;
        [_mainWindow addSubview:baseView];
        
        
        /***********************************************
         Please add subViews on baseView as necessary.
        ************************************************/
        // For example

        // Use UIView
        UIView *backSubView = [[UIView alloc] init];
        backSubView.frame = CGRectMake(0, 0, 280.0f, 400.0f);
        backSubView.center = _mainWindow.center;
        backSubView.backgroundColor = [UIColor whiteColor];
        backSubView.layer.opacity = OPACITY_SUBVIEW_SHOW_INIT;
        backSubView.layer.transform = CATransform3DMakeScale_SHOW_INIT
        backSubView.tag = SUBVIEW1_TAG;
        [baseView addSubview:backSubView];
        
        // Use UIImageView
        /*
        UIImageView *imageView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"your_image_name"];
        imageView.image = image;
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        imageView.center = _mainWindow.center;
        imageView.tag = SUBVIEW1_TAG;
        imageView.layer.opacity = 0.5f;
        imageView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0f);
        [baseView addSubview:imageView];
        */
        
        // Use UIButton
        UIButton *btSubView = [UIButton buttonWithType:UIButtonTypeSystem];
        btSubView.frame = CGRectMake(0, 0, 200.0f, 80.0f);
        btSubView.center = CGPointMake(_mainWindow.center.x, _mainWindow.center.y + 100.0f);
        btSubView.backgroundColor = [UIColor lightGrayColor];
        [btSubView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btSubView setTitle:NSLocalizedString(@"Button", @"") forState:UIControlStateNormal];
        [btSubView addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        btSubView.layer.opacity = OPACITY_SUBVIEW_SHOW_INIT;
        btSubView.layer.transform = CATransform3DMakeScale_SHOW_INIT
        btSubView.tag = SUBVIEW2_TAG;
        [baseView addSubview:btSubView];
        
        
        [UIView animateWithDuration:0.2f
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             _mainWindow.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.5f];
                             
                             backSubView.layer.transform = CATransform3DMakeScale_SHOW_ANIM
                             backSubView.layer.opacity   = OPACITY_SUBVIEW_SHOW_ANIM;
                             
                             btSubView.layer.transform   = CATransform3DMakeScale_SHOW_ANIM
                             btSubView.layer.opacity     = OPACITY_SUBVIEW_SHOW_ANIM;
                             
                         }
                         completion:NULL
         ];
        
    }
    
}


- (void)hideWindow
{
    if (_mainWindow) {
        
        UIView *aView = [_mainWindow viewWithTag:BASEVIEW_TAG];
        UIView *backSubView  = (UIView*)[aView viewWithTag:SUBVIEW1_TAG];
        UIButton *btSubView  = (UIButton*)[aView viewWithTag:SUBVIEW2_TAG];
        
        [UIView animateWithDuration:0.2f
                              delay:0.0f
                            options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             
                             _mainWindow.backgroundColor = [UIColor clearColor];
                             
                             backSubView.layer.transform = CATransform3DMakeScale_HIDE_ANIM
                             backSubView.layer.opacity   = OPACITY_SUBVIEW_HIDE_ANIM;
                             
                             btSubView.layer.transform   = CATransform3DMakeScale_HIDE_ANIM
                             btSubView.layer.opacity     = OPACITY_SUBVIEW_HIDE_ANIM;
                             
                         }
                         completion:^(BOOL finished) {
                             
                             for (UIView *subview in [_mainWindow subviews]) {
                                 [subview removeFromSuperview];
                             }
                             
                             _mainWindow = nil;
                             
                         }
         ];
        
    }
}


#pragma mark -
#pragma mark CLSCustomBaseViewDelegate
- (void)touchesEventHandle
{
    if (_enableBaseViewTouch) {
        [self hideWindow];
    }
}

#pragma mark -
#pragma mark Button Action
- (void)buttonTap:(id)sender
{
    if ([_delegate respondsToSelector:@selector(buttonTapEventHandle)]) {
        [_delegate buttonTapEventHandle];
    };
}

@end
