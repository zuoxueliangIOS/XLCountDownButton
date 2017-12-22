//
//  XLCountDownButton.m
//  XLCountDownButton
//
//  Created by ZxlAndZyp on 2017/12/22.
//  Copyright © 2017年 zuoxueliang. All rights reserved.
//

#import "XLCountDownButton.h"

@implementation XLCountDownButton

#pragma -mark touche action
-(void)addToucheHandler:(TouchedDownBlock)touchHandler{
    _touchedDownBlock = [touchHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touched:(XLCountDownButton*)sender{
    if (_touchedDownBlock) {
        _touchedDownBlock(sender.tag);
    }
}

- (void)removeTouch
{
    [_timer invalidate];
}


#pragma -mark count down method
-(void)startWithSecond:(int)totalSecond
{
    _totalSecond = totalSecond;
    _second = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)timerStart:(NSTimer *)theTimer {
    if (_second == 1)
    {
        [self stop];
    }
    else
    {
        _second--;
        if (_didChangeBlock)
        {
            NSString *title = _didChangeBlock(_second);
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            if (_didUpdateBlock) {
                _didUpdateBlock(title);
            }
        }
        else
        {
            NSString *title = [NSString stringWithFormat:@"%d秒后重新获取",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            
        }
    }
}

- (void)stop{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                if (_didFinishedBlock)
                {
                    NSString *title = _didFinishedBlock(_totalSecond);
                    [self setTitle:title forState:UIControlStateNormal];
                    [self setTitle:title forState:UIControlStateDisabled];
                    if (self.didUpdateBlock) {
                        self.didUpdateBlock(title);
                    }
                }
                else
                {
                    [self setTitle:@"重新获取" forState:UIControlStateNormal];
                    [self setTitle:@"重新获取" forState:UIControlStateDisabled];
                    
                }
            }
        }
    }
}
#pragma -mark block
-(void)didChange:(DidChangeBlock)didChangeBlock{
    _didChangeBlock = [didChangeBlock copy];
}
-(void)didFinished:(DidFinishedBlock)didFinishedBlock{
    _didFinishedBlock = [didFinishedBlock copy];
}

@end
