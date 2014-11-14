//
//  ViewController.m
//  FlyingMario
//
//  Created by Amit Borude on 11/12/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    HighScoreNumber=[[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text=[NSString stringWithFormat:@"High Score : %li", (long)HighScoreNumber];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
