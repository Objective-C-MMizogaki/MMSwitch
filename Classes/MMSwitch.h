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


#import <UIKit/UIKit.h>

@interface MMSwitch : UIControl

@property(nonatomic, retain) UIColor *tintColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, retain) UIColor *onTintColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, assign) UIColor *offTintColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, assign) UIColor *thumbTintColor UI_APPEARANCE_SELECTOR;

@property(nonatomic,getter=isOn) BOOL on;

- (id)initWithFrame:(CGRect)frame;

- (void)setOnButtonText:(NSString*)onButtonText
     setButtonTextColer:(UIColor *)onButtonColor
         setOnTextColer:(UIColor *)onColor
       setOffButtonText:(NSString*)offButtonText
  setTextButtonOffColer:(UIColor *)offButtonColor
        setOffTextColer:(UIColor *)offColor
        setTextFontSize:(NSInteger)size;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

- (void)setOnImageNamed:(NSString*)imageName;
- (void)setOffImageNamed:(NSString*)imageName;

@end
