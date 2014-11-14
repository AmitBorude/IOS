//
//  AddViewController.h
//  IOSFirst
//
//  Created by Vishal Chothani on 10/22/14.
//  Copyright (c) 2014 277. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *callReasonTexttField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@end
