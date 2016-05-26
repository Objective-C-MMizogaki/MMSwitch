/*
 * MMSwitch
 *
 * Created by MMizogaki on 10/2/15.
 * Copyright (c) 2015 MMizogaki . All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


#import "MMSwitch.h"
#import <QuartzCore/QuartzCore.h>


@interface MMSwitch () <UIGestureRecognizerDelegate> {
    CAShapeLayer *thumbLayer;
    CAShapeLayer *fillLayer;
    CAShapeLayer *backLayer;
    CALayer *onImageViewLayer;
    CALayer *offImageViewLayer;
    UILabel *onButtonLableLayer;
    UILabel *offButtonLableLayer;
    
    UILabel *onLableLayer;
    UILabel *offLableLayer;
    
    BOOL draggingFlag;
    BOOL onFlag;
}
@property (nonatomic, assign) BOOL pressed;
- (void) setBackgroundOn:(BOOL)on animated:(BOOL)animated;
- (void) showFillLayer:(BOOL)show animated:(BOOL)animated;
- (CGRect) thumbFrameForState:(BOOL)isOn;
@end

@implementation MMSwitch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if( (self = [super initWithCoder:aDecoder]) ){
        [self layoutIfNeeded];
        [self configure];
    }
    return self;
}

- (void)configure {
    
    if (self.frame.size.height > self.frame.size.width*0.65) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, ceilf(0.6*self.frame.size.width));
    }
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.onTintColor = [UIColor colorWithRed:0.27f green:0.85f blue:0.37f alpha:1.00f];
    [self setBacklayerOnTintColorIfNeeded];
    
    self.tintColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
    [self setBacklayerTintColorIfNeeded];
    
    onFlag = NO;
    self.pressed = NO;
    draggingFlag = NO;
    
    
    backLayer = [CAShapeLayer layer];
    backLayer.backgroundColor = [[UIColor clearColor] CGColor];
    backLayer.frame = self.bounds;
    backLayer.cornerRadius = self.bounds.size.height/2.0;
    CGPathRef path1 = [UIBezierPath bezierPathWithRoundedRect:backLayer.bounds cornerRadius:floorf(backLayer.bounds.size.height/2.0)].CGPath;
    backLayer.path = path1;
    [backLayer setValue:[NSNumber numberWithBool:NO] forKey:@"isOn"];
    backLayer.fillColor = [_tintColor CGColor];
    [self.layer addSublayer:backLayer];
    
    fillLayer = [CAShapeLayer layer];
    fillLayer.backgroundColor = [[UIColor clearColor] CGColor];
    fillLayer.frame = CGRectInset(self.bounds, 1.5, 1.5);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:fillLayer.bounds cornerRadius:floorf(fillLayer.bounds.size.height/2.0)].CGPath;
    fillLayer.path = path;
    [fillLayer setValue:[NSNumber numberWithBool:YES] forKey:@"isVisible"];
    fillLayer.fillColor = [[UIColor whiteColor] CGColor];
    [self.layer addSublayer:fillLayer];
    
    
    thumbLayer = [CAShapeLayer layer];
    thumbLayer.backgroundColor = [[UIColor clearColor] CGColor];
    thumbLayer.frame = CGRectMake(2.0, 2.0, self.bounds.size.height-4.0, self.bounds.size.height-4.0);
    thumbLayer.cornerRadius = thumbLayer.frame.size.height/2.0;
    CGPathRef knobPath = [UIBezierPath bezierPathWithRoundedRect:thumbLayer.bounds cornerRadius:floorf(thumbLayer.bounds.size.height/2.0)].CGPath;
    thumbLayer.path = knobPath;
    thumbLayer.fillColor = [UIColor whiteColor].CGColor;
    thumbLayer.shadowColor = [UIColor blackColor].CGColor;
    thumbLayer.shadowOffset = CGSizeMake(0.0, 3.0);
    thumbLayer.shadowRadius = 3.0;
    thumbLayer.shadowOpacity = 0.3;
    [self.layer addSublayer:thumbLayer];
    
    onImageViewLayer = [CALayer layer];
    offImageViewLayer = [CALayer layer];
    onButtonLableLayer = [[UILabel alloc]init];
    offButtonLableLayer = [[UILabel alloc]init];
    onLableLayer = [[UILabel alloc]init];
    offLableLayer = [[UILabel alloc]init];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(tapped:)];
    [tapGestureRecognizer setDelegate:self];
    [self addGestureRecognizer:tapGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(toggleDragged:)];
    //[panGestureRecognizer requireGestureRecognizerToFail:tapGestureRecognizer];
    [panGestureRecognizer setDelegate:self];
    [self addGestureRecognizer:panGestureRecognizer];
}


#pragma mark -
#pragma mark Images
- (void)setOnImageNamed:(NSString*)imageName{
    
    onImageViewLayer.contents = (id)[UIImage imageNamed:imageName].CGImage;
    onImageViewLayer.backgroundColor = [[UIColor clearColor] CGColor];
    onImageViewLayer.frame = CGRectMake(0.0, 0.0, thumbLayer.frame.size.width, thumbLayer.frame.size.height);
    
    [thumbLayer addSublayer:onImageViewLayer];
    [self setImagesOn:onFlag];
}

- (void)setOffImageNamed:(NSString*)imageName{
    offImageViewLayer.contents = (id)[UIImage imageNamed:imageName].CGImage;
    offImageViewLayer.backgroundColor = [[UIColor clearColor] CGColor];
    offImageViewLayer.frame = CGRectMake(0.0, 0.0, thumbLayer.frame.size.width, thumbLayer.frame.size.height);
    
    [thumbLayer addSublayer:offImageViewLayer];
    [self setImagesOn:onFlag];
}


#pragma mark - Text
- (void)setOnButtonText:(NSString*)onButtonText
     setButtonTextColer:(UIColor *)onButtonColor
         setOnTextColer:(UIColor *)onColor
       setOffButtonText:(NSString*)offButtonText
  setTextButtonOffColer:(UIColor *)offButtonColor
        setOffTextColer:(UIColor *)offColor
        setTextFontSize:(NSInteger)size {
    
    onButtonLableLayer.adjustsFontSizeToFitWidth = YES;
    onButtonLableLayer.minimumScaleFactor = 0;
    [onButtonLableLayer setFont:[UIFont systemFontOfSize:size]];
    [onButtonLableLayer setFrame:CGRectMake(0,
                                            0,
                                            thumbLayer.frame.size.width,
                                            thumbLayer.frame.size.height)];
    [onButtonLableLayer setText:onButtonText];
    [onButtonLableLayer setTextAlignment:NSTextAlignmentCenter];
    [onButtonLableLayer setTextColor:onButtonColor];
    [thumbLayer addSublayer:onButtonLableLayer.layer];
    
    offButtonLableLayer.adjustsFontSizeToFitWidth = YES;
    offButtonLableLayer.minimumScaleFactor = 0;
    [offButtonLableLayer setFont:[UIFont systemFontOfSize:size]];
    [offButtonLableLayer setFrame:CGRectMake(0,
                                             0,
                                             thumbLayer.frame.size.width,
                                             thumbLayer.frame.size.height)];
    [offButtonLableLayer setText:offButtonText];
    [offButtonLableLayer setTextAlignment:NSTextAlignmentCenter];
    [offButtonLableLayer setTextColor:offButtonColor];
    [thumbLayer addSublayer:offButtonLableLayer.layer];
    
    
    onLableLayer.adjustsFontSizeToFitWidth = YES;
    onLableLayer.minimumScaleFactor = 0;
    [onLableLayer setFont:[UIFont systemFontOfSize:size]];
    [onLableLayer setFrame:CGRectMake(fillLayer.frame.size.width/4,
                                      fillLayer.frame.size.height/4-1,
                                      fillLayer.frame.size.width,
                                      fillLayer.frame.size.height/2)];
    [onLableLayer setText:onButtonText];
    [onLableLayer setTextAlignment:NSTextAlignmentCenter];
    [onLableLayer setTextColor:onColor];
    [fillLayer addSublayer:onLableLayer.layer];
    
    
    offLableLayer.adjustsFontSizeToFitWidth = YES;
    offLableLayer.minimumScaleFactor = 0;
    [offLableLayer setFont:[UIFont systemFontOfSize:size]];
    [offLableLayer setFrame:CGRectMake(-backLayer.frame.size.width/4,
                                       backLayer.frame.size.height/4,
                                       backLayer.frame.size.width,
                                       backLayer.frame.size.height/2)];
    [offLableLayer setText:offButtonText];
    [offLableLayer setTextAlignment:NSTextAlignmentCenter];
    [offLableLayer setTextColor:offColor];
    [backLayer addSublayer:offLableLayer.layer];
    
    
    [self setImagesOn:onFlag];
}



#pragma mark -
#pragma mark Animations

- (BOOL) isOn {
    return onFlag;
}

- (void) setOn:(BOOL)on {
    [self setOn:on animated:NO];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated {
    
    if (onFlag != on) {
        [self willChangeValueForKey:@"on"];
        onFlag = on;
        [self didChangeValueForKey:@"on"];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    [CATransaction begin];
    if (animated) {
        [CATransaction setAnimationDuration:0.3];
        [CATransaction setDisableActions:NO];
        thumbLayer.frame = [self thumbFrameForState:onFlag];
    }else {
        [CATransaction setDisableActions:YES];
        thumbLayer.frame = [self thumbFrameForState:onFlag];
    }
    [CATransaction commit];
    
    [self setBackgroundOn:onFlag animated:animated];
    [self showFillLayer:!onFlag animated:animated];
    [self setImagesOn:onFlag];
}

-(void)setImagesOn:(BOOL)on{
    CALayer *animOut = nil;
    CALayer *animIn = nil;
    
    if(on){
        animOut = offImageViewLayer;
        animIn = onImageViewLayer;
        
        [offButtonLableLayer setHidden:YES];
        [onButtonLableLayer setHidden:NO];
    }
    else{
        animOut = onImageViewLayer;
        animIn = offImageViewLayer;
        
        [offButtonLableLayer setHidden:NO];
        [onButtonLableLayer setHidden:YES];
    }
    
    animOut.frame = CGRectMake(thumbLayer.frame.size.width/2, thumbLayer.frame.size.height/2, 0, 0);
    animIn.frame = CGRectMake(0.0, 0.0, thumbLayer.frame.size.width, thumbLayer.frame.size.height);
    
}

- (void) setBackgroundOn:(BOOL)on animated:(BOOL)animated {
    BOOL isOn = [[backLayer valueForKey:@"isOn"] boolValue];
    if (on != isOn) {
        [backLayer setValue:[NSNumber numberWithBool:on] forKey:@"isOn"];
        if (animated) {
            CABasicAnimation *animateColor = [CABasicAnimation animationWithKeyPath:@"fillColor"];
            animateColor.duration = 0.22;
            animateColor.fromValue = on ? (id)_tintColor.CGColor : (id)_onTintColor.CGColor;
            animateColor.toValue = on ? (id)_onTintColor.CGColor : (id)_tintColor.CGColor;
            animateColor.removedOnCompletion = NO;
            animateColor.fillMode = kCAFillModeForwards;
            [backLayer addAnimation:animateColor forKey:@"animateColor"];
            [CATransaction commit];
        }else {
            [backLayer removeAllAnimations];
            backLayer.fillColor = on ? _onTintColor.CGColor : _tintColor.CGColor;
        }
    }
}

- (void) showFillLayer:(BOOL)show animated:(BOOL)animated {
    BOOL isVisible = [[fillLayer valueForKey:@"isVisible"] boolValue];
    if (isVisible != show) {
        [fillLayer setValue:[NSNumber numberWithBool:show] forKey:@"isVisible"];
        if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_6_0) {
            fillLayer.opacity = show ? 1.0 : 0.0;
        } else {
            CGFloat scale = show ? 1.0 : 0.0;
            if (animated) {
                CGFloat from = show ? 0.0 : 1.0;
                CABasicAnimation *animateScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                animateScale.duration = 0.22;
                animateScale.fromValue = @(from);
                animateScale.toValue = @(scale);
                animateScale.removedOnCompletion = NO;
                animateScale.fillMode = kCAFillModeForwards;
                animateScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [fillLayer addAnimation:animateScale forKey:@"animateScale"];
            } else {
                [fillLayer removeAllAnimations];
                [fillLayer setValue:@(scale) forKeyPath:@"transform.scale"];
            }
        }
    }
}

- (void) setPressed:(BOOL)pressed {
    if (_pressed != pressed) {
        _pressed = pressed;
        
        if (!onFlag) {
            [self showFillLayer:!_pressed animated:YES];
        }
    }
}

#pragma mark -
#pragma mark Appearance

- (void) setTintColor:(UIColor *)tintColor {
    [self setBacklayerTintColorIfNeeded];
}

- (void)setBacklayerTintColorIfNeeded
{
    if (![[backLayer valueForKey:@"isOn"] boolValue]) {
        backLayer.fillColor = [_tintColor CGColor];
    }
}

- (void)setOnTintColor:(UIColor *)onTintColor {
    _onTintColor = onTintColor;
    [self setBacklayerOnTintColorIfNeeded];
}

- (void)setBacklayerOnTintColorIfNeeded
{
    if ([[backLayer valueForKey:@"isOn"] boolValue]) {
        backLayer.fillColor = [_onTintColor CGColor];
    }
}

- (void)setOffTintColor:(UIColor *)offTintColor {
    fillLayer.fillColor = [offTintColor CGColor];
}

- (UIColor *)offTintColor {
    return [UIColor colorWithCGColor:fillLayer.fillColor];
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor {
    thumbLayer.fillColor = [thumbTintColor CGColor];
}

- (UIColor *)thumbTintColor {
    return [UIColor colorWithCGColor:thumbLayer.fillColor];
}

- (void) setEnabled:(BOOL)enabled
{
    self.alpha = enabled ? 1.f : .5f;
    [super setEnabled:enabled];
}

#pragma mark -
#pragma mark Interaction

- (void)tapped:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
        [self setOn:!self.on animated:YES];
}

- (void)toggleDragged:(UIPanGestureRecognizer *)gesture
{
    CGFloat minToggleX = 1.0;
    CGFloat maxToggleX = self.bounds.size.width-self.bounds.size.height+1.0;
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.pressed = YES;
        draggingFlag = YES;
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gesture translationInView:self];
        
        [CATransaction setDisableActions:YES];
        
        self.pressed = YES;
        
        CGFloat newX = thumbLayer.frame.origin.x + translation.x;
        if (newX < minToggleX) newX = minToggleX;
        if (newX > maxToggleX) newX = maxToggleX;
        thumbLayer.frame = CGRectMake(newX,
                                       thumbLayer.frame.origin.y,
                                       thumbLayer.frame.size.width,
                                       thumbLayer.frame.size.height);
        
        if (CGRectGetMidX(thumbLayer.frame) > CGRectGetMidX(self.bounds)
            && ![[backLayer valueForKey:@"isOn"] boolValue]) {
            [self setBackgroundOn:YES animated:YES];
        }else if (CGRectGetMidX(thumbLayer.frame) < CGRectGetMidX(self.bounds)
                  && [[backLayer valueForKey:@"isOn"] boolValue]){
            [self setBackgroundOn:NO animated:YES];
        }
        
        
        [gesture setTranslation:CGPointZero inView:self];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        CGFloat toggleCenter = CGRectGetMidX(thumbLayer.frame);
        [self setOn:(toggleCenter > CGRectGetMidX(self.bounds)) animated:YES];
        draggingFlag = NO;
        self.pressed = NO;
    }
    
    CGPoint locationOfTouch = [gesture locationInView:self];
    if (CGRectContainsPoint(self.bounds, locationOfTouch))
        [self sendActionsForControlEvents:UIControlEventTouchDragInside];
    else
        [self sendActionsForControlEvents:UIControlEventTouchDragOutside];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    self.pressed = YES;
    
    [self sendActionsForControlEvents:UIControlEventTouchDown];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if (!draggingFlag) {
        self.pressed = NO;
    }
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    if (!draggingFlag) {
        self.pressed = NO;
    }
    [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
}

#pragma mark -
#pragma mark Thumb Frame

- (CGRect) thumbFrameForState:(BOOL)isOn {
    return CGRectMake(isOn ? self.bounds.size.width-self.bounds.size.height+2.0 : 2.0,
                      2.0,
                      self.bounds.size.height-4.0,
                      self.bounds.size.height-4.0);
}

#pragma mark -
#pragma mark Dealloc

- (void) dealloc {
    _tintColor = nil;
    _onTintColor = nil;
    thumbLayer = nil;
    fillLayer = nil;
    backLayer = nil;
    onImageViewLayer = nil;
    offImageViewLayer = nil;
}

@end
