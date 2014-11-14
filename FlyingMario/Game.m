//
//  Game.m
//  FlyingMario
//
//  Created by Amit Borude on 11/12/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game




-(void)Score{

    ScoreNumber=ScoreNumber+5;
    
    ScoreLabel.text=[NSString stringWithFormat:@"%i", ScoreNumber];
    
}


-(IBAction)StartGame:(id)sender{

    StartGame.hidden=YES;
    
    MarioMovement= [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(MarioMoving) userInfo:nil repeats:YES];
    
    
    [self PlaceGhosts];
    
    
   GhostMovement=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(GhostMoving) userInfo:nil repeats:YES];
    
}


-(void)PlaceGhosts{
 
    RandomTopGhostPosition =arc4random() %350;
    RandomTopGhostPosition=RandomTopGhostPosition -228;
    
    RandomBottomGhostPosition=RandomTopGhostPosition+300;
    
    GhostTop.center=CGPointMake(340, RandomTopGhostPosition);
    GhostBottom.center=CGPointMake(340, RandomBottomGhostPosition);
    
    
}

-(void)GhostMoving{
 
    GhostTop.center=CGPointMake(GhostTop.center.x-1, GhostTop.center.y);
    GhostBottom.center=CGPointMake(GhostBottom.center.x-1, GhostBottom.center.y);
    
    if(GhostTop.center.x < -22 && GhostBottom.center.x< -20){
        [self PlaceGhosts];
    }
    if(GhostBottom.center.x== 0)
    {
        [self Score];
    }
    
    if(CGRectIntersectsRect(Mario.frame, GhostTop.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Mario.frame, GhostBottom.frame)){
        [self GameOver];
    }
    
}


-(void)GameOver{
    
    
    if(ScoreNumber > HighScoreNumber)
    {
          [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
 
    [GhostMovement invalidate];
    [MarioMovement invalidate];
    
    Exit.hidden=NO;
    GhostTop.hidden=YES;
    GhostBottom.hidden=YES;
    Mario.hidden=YES;
}




-(void)MarioMoving{
    
    Mario.center=CGPointMake(Mario.center.x, Mario.center.y-MarioFlight);
    
    MarioFlight=MarioFlight-7;
    

    if(MarioFlight < -15)
    {
        MarioFlight=-15;
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    MarioFlight=30;
}


- (void)viewDidLoad {
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber=[[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
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
