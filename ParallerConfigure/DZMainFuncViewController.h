//
//  DZMainFuncViewController.h
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMainFuncViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField* spriteNameTextField;
@property (nonatomic, weak) IBOutlet UISwitch* frameSwitch;
@property (nonatomic, weak) IBOutlet UISwitch* alphaSwitch;
@property (nonatomic, weak) IBOutlet UISwitch* rotationSwitch;
@property (nonatomic, weak) IBOutlet UILabel* countLabel;
- (IBAction) addSprite:(id)sender;
- (IBAction)checkPages:(id)sender;
- (IBAction) saveConfigureData:(id)sender;
@end
