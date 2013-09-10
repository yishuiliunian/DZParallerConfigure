//
//  DZMainFuncViewController.m
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import "DZMainFuncViewController.h"
#import "DZCheckPagesViewController.h"
@interface DZMainFuncViewController ()

@end

@implementation DZMainFuncViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [DZConfigureData shareInstance];
    
    
	// Do any additional setup after loading the view.
}
- (IBAction)checkPages:(id)sender
{
    [self.navigationController pushViewController:[DZCheckPagesViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) addSprite:(id)sender
{
    NSString* name = self.spriteNameTextField.text;
    NSMutableArray* params = [NSMutableArray new];
    if (self.rotationSwitch.on) {
        [params addObject:kWizParallerRotation];
    }
    if (self.frameSwitch.on) {
        [params addObject:kWizParallerRect];
    }
    if (self.alphaSwitch.on) {
        [params addObject:kWizParallerAlpha];
    }
    
    NSMutableDictionary* sprite = [NSMutableDictionary new];
    [sprite setObject:params forKey:kWizParallerChangedParamers];
    
    NSMutableDictionary* dic = [[DZConfigureData  shareInstance] configureData];
    [dic setObject:sprite forKey:name];

    self.countLabel.text = [@(dic.allKeys.count) stringValue];
}

- (IBAction) saveConfigureData:(id)sender
{
    [[DZConfigureData shareInstance] saveData];
}
@end
