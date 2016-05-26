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
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MMSwitch *rnnSwich;
@property (weak, nonatomic) IBOutlet MMSwitch *rnnSwitch1;
@property (weak, nonatomic) IBOutlet MMSwitch *rnnSwitch2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rnnSwich setOnButtonText:@"ON"
                setButtonTextColer:[UIColor colorWithRed:0.0 green:0.251 blue:0.502 alpha:1.0]
                    setOnTextColer:[UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0]
                  setOffButtonText:@"OFF"
             setTextButtonOffColer:[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0]
                   setOffTextColer:[UIColor colorWithRed:1.0 green:0.0 blue:0.502 alpha:1.0]
                   setTextFontSize:17];
    
    [self.rnnSwich setTintColor:[UIColor colorWithRed:0.7043f green:0.806f blue:0.806f alpha:1.0f]];
    [self.rnnSwich setOnTintColor:[UIColor colorWithRed:0.0f green:1.0f blue:0.502f alpha:1.0f]];
    [self.rnnSwich setOffTintColor:[UIColor colorWithRed:0.4f green:1.0f blue:0.8f alpha:1.0f]];
    [self.rnnSwich setThumbTintColor:[UIColor colorWithRed:1.0 green:0.4 blue:1.0 alpha:1.0]];
    
    [self.rnnSwitch1 setTintColor:[UIColor colorWithRed:0.58f green:0.65f blue:0.65f alpha:1.00f]];
    [self.rnnSwitch1 setOnTintColor:[UIColor colorWithRed:0.23f green:0.35f blue:0.60f alpha:1.00f]];
    [self.rnnSwitch1 setOffTintColor:[UIColor colorWithRed:0.91f green:0.30f blue:0.24f alpha:1.00f]];
    [self.rnnSwitch1 setThumbTintColor:[UIColor grayColor]];
    
    [self.rnnSwitch2 setTintColor:[UIColor colorWithRed:1.0f green:0.4f blue:1.0f alpha:1.0f]];
    [self.rnnSwitch2 setOnTintColor:[UIColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f]];
    [self.rnnSwitch2 setOffTintColor:[UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f]];
    
    
}

- (IBAction)nenennene:(id)sender {
    
    if (self.rnnSwich.on == YES) {
        NSLog(@"ON");
    }else {
        NSLog(@"OFF");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
