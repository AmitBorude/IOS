//
//  Hero.h
//  SuperHero
//
//  Created by Amit Borude on 11/5/14.
//  Copyright (c) 2014 Amit Borude. All rights reserved.
//

#import <UIKit/UIKit.h>

int MarioFlight;


@interface Hero : UIViewController
{
    
    IBOutlet UIImageView *Mario;
    IBOutlet UIButton *StartGame;
    
    NSTimer *MarioMovement;
  
    
}


-(IBAction)StartGame:(id)sender;
-(void)MarioMoving;

@end
