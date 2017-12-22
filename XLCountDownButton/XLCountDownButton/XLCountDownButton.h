//
//  XLCountDownButton.h
//  XLCountDownButton
//
//  Created by ZxlAndZyp on 2017/12/22.
//  Copyright © 2017年 zuoxueliang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSString* (^DidChangeBlock)(int second);
typedef NSString* (^DidFinishedBlock)(int second);

typedef void (^TouchedDownBlock)(NSInteger tag);

typedef void (^updateBlock)(NSString *title);
@interface XLCountDownButton : UIButton
{
    int _second;
    int _totalSecond;
    
    NSTimer *_timer;
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}
//@property(nonatomic,strong)UIColor *changeFontColor;
//@property(nonatomic,strong)UIColor *normalFontColor;
@property (nonatomic ,copy)updateBlock didUpdateBlock;

-(void)addToucheHandler:(TouchedDownBlock)touchHandler;

-(void)didChange:(DidChangeBlock)didChangeBlock;
-(void)didFinished:(DidFinishedBlock)didFinishedBlock;
-(void)startWithSecond:(int)second;
- (void)stop;
- (void)removeTouch;
@end
