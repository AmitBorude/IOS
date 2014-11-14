//
//  Game.h
//  FlyingMario
//
//  Created by Amit Borude on 11/12/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import <UIKit/UIKit.h>

int MarioFlight;
int RandomTopGhostPosition;
int RandomBottomGhostPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Mario;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *GhostBottom;
    IBOutlet UIImageView *GhostTop;
    
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    
    
    
    NSTimer *MarioMovement;
    NSTimer *GhostMovement;



}

-(IBAction)StartGame:(id)sender;
-(void)MarioMoving;
-(void)GhostMoving;
-(void)PlaceGhosts;

-(void)Score;
-(void)GameOver;




@end
