//
//  TRACustomBaseView.h
//  TRACustomWindow
//
//  Created by Toshikazu Fukuoka on 2014/05/27.
//  Copyright (c) 2014年 Toshikazu Fukuoka. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TRACustomBaseViewDelegate;

@interface TRACustomBaseView : UIView
@property (nonatomic, strong) id<TRACustomBaseViewDelegate> delegate;
@end

@protocol TRACustomBaseViewDelegate <NSObject>
- (void)touchesEventHandle;
@end