# MMSwitch
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-Objective–C-brightgreen.svg?style=flat
)](https://developer.apple.com/jp/documentation/)
[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/MMSwitch.svg)](https://img.shields.io/cocoapods/v/MMSwitch.svg)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
            )](http://mit-license.org)


## App Image



## With CocoaPods
Just add this line to your podfile.
```
'MMSwitch', '1.2.2'
```

## Manual installation

Super simple. Just drag & drop MMSwitch.h/.m into your project.

QuartzCore.framework


## Usage
The simplest way to get up and running with MMSwitch is to display a default view. Inside of your view controller, write the following code:

``` objective-c

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
}

- (IBAction)nenennene:(id)sender {
    
    if (self.rnnSwich.on == YES) {
        NSLog(@"ON");
    }else {
        NSLog(@"OFF");
    }
}
    
```

## Memo
iOS9 correspondence.  
I support that until iPhone4S〜iPhone6S+.  

## Licence
MIT

Created by MMizogaki on 10/2/16.
Copyright (c) 2015 MMizogaki . All rights reserved.
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Author

[MizogakiMasahito](https://github.com/MMizogaki)

