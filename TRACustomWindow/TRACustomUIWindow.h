//
//  TRACustomUIWindow.h
//  TRACustomWindow
//
//  Created by Toshikazu Fukuoka on 2014/05/27.
//  Copyright (c) 2014年 Toshikazu Fukuoka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRACustomBaseView.h"

@protocol TRACustomUIWindowDelegate;

@interface TRACustomUIWindow : UIView <TRACustomBaseViewDelegate>
@property (nonatomic, assign) id<TRACustomUIWindowDelegate> delegate;
@property (nonatomic) BOOL enableBaseViewTouch; // Default is YES

+ (TRACustomUIWindow *)sharedInstance;
- (void)showWindow;
- (void)hideWindow;

@end

@protocol TRACustomUIWindowDelegate <NSObject>
- (void)buttonTapEventHandle;
@end
