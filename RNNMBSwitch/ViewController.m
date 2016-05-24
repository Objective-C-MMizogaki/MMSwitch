//
//  ViewController.m
//  RNNMBSwitch
//
//  Created by 溝垣雅人 on 2/8/16.
//  Copyright © 2016 [MMasahito](https://github.com/MMasahito). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RNNMBSwitch *rnnSwich;
@property (weak, nonatomic) IBOutlet RNNMBSwitch *rnnSwitch1;
@property (weak, nonatomic) IBOutlet RNNMBSwitch *rnnSwitch2;
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
