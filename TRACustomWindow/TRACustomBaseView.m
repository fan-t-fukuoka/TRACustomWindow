//
//  TRACustomBaseView.m
//  TRACustomWindow
//
//  Created by Toshikazu Fukuoka on 2014/05/27.
//  Copyright (c) 2014年 Toshikazu Fukuoka. All rights reserved.
//

#import "TRACustomBaseView.h"

@implementation TRACustomBaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark -
#pragma mark UIResponder Touches Event Handle

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if ([_delegate respondsToSelector:@selector(touchesEventHandle)]) {
        [_delegate touchesEventHandle];
    };
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
