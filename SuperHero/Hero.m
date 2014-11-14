//
//  Hero.m
//  SuperHero
//
//  Created by Amit Borude on 11/5/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import "Hero.h"

@interface Hero ()

@end

@implementation Hero



-(IBAction)StartGame:(id)sender{
    StartGame.hidden=YES;
    
    MarioMovement= [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(MarioMoving)
                                                  userInfo:nil repeats:YES];


}








-(void)MarioMoving{
    Mario.center= CGPointMake(Mario.center.x, Mario.center.y-MarioFlight);
    
    MarioFlight=MarioFlight-5;
    
    
    if(MarioFlight< -15)
    {
        MarioFlight=-15;
    }
    

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    MarioFlight=30;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
