//
//  Game.m
//  Flappy Bird
//
//  Created by Amit Borude on 11/4/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end


@implementation Game


-(void) GameOver{
    
    
    if(ScoreNumber>HighScoreNumber)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    Exit.hidden=NO;
    TunnelTop.hidden=YES;
    TunnelBottom.hidden=YES;
    fly1.hidden=YES;

}



-(void) Score{
    
    ScoreNumber=ScoreNumber+5;
    ScoreLabel.text=[NSString stringWithFormat:@"%i",ScoreNumber];
    
    
}

-(IBAction)StartGame:(id)sender{
    
    TunnelBottom.hidden=NO;
    TunnelTop.hidden=NO;
    Exit.hidden=YES;
    ScoreNumber=0;
    
    StartGame.hidden=YES;
    
    BirdMovement=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving)
                  
                                                userInfo:nil repeats:YES];
    
    
    [self PlaceTunnels];
    
    TunnelMovement=[NSTimer scheduledTimerWithTimeInterval:0.01  target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];

}



-(void)TunnelMoving{
    TunnelTop.center=CGPointMake(TunnelTop.center.x-1, TunnelTop.center.y);
    TunnelBottom.center=CGPointMake(TunnelBottom.center.x-1, TunnelBottom.center.y);
    
    
    
    if(TunnelTop.center.x<-40)
    {
        [self PlaceTunnels];
    }
    
    
    
    if(TunnelTop.center.x==16)
    {
        [self Score];
    }
    else if(TunnelBottom.center.x==16)
    {
        [self Score];
    }
    else{
        
    }
    
    if(CGRectIntersectsRect(fly1.frame, TunnelTop.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(fly1.frame, TunnelBottom.frame)){
        [self GameOver];
    }
  
    
}





-(void)PlaceTunnels{

    RandomTopTunnelPosition=arc4random()%350;
    RandomTopTunnelPosition= RandomTopTunnelPosition - 228;
    
    RandomBottomTunnelPosition=RandomTopTunnelPosition+ 700;
    
    TunnelTop.center=CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center=CGPointMake(340, RandomBottomTunnelPosition);
}


-(void)BirdMoving{
    
    
    fly1.center=CGPointMake(fly1.center.x, fly1.center.y - BirdFlight);
    
    BirdFlight=BirdFlight-12;
    
    if(BirdFlight< -15){
        BirdFlight = -15;
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BirdFlight=30;
   
    
}


- (void)viewDidLoad {

    Exit.hidden=YES;
    
    
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
