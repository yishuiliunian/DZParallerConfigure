//
//  DZViewController.h
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField*  originX;
@property (nonatomic, weak) IBOutlet UITextField* originY;
@property (nonatomic, weak) IBOutlet UITextField* width;
@property (nonatomic, weak) IBOutlet UITextField* height;
@property (nonatomic, weak) IBOutlet UITextField* name;
@property (nonatomic, weak) IBOutlet UITextField* alpha;
@property (nonatomic, weak) IBOutlet UITextField* page;
@property (nonatomic, strong) NSString* spriteName;
@property (nonatomic, strong) NSString* pageCountStr;
- (IBAction) addAConfigure:(id)sender;
@end
