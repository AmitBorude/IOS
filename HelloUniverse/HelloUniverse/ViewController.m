//
//  ViewController.m
//  HelloUniverse
//
//  Created by Amit Borude on 11/2/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mylabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int year=2014;
    int month=11;
    int day=2;
    mylabel.text=[[NSString alloc]initWithFormat:@"Current Year %i/%i/%i", day,month, year];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
