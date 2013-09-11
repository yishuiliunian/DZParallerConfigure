//
//  DZViewController.m
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import "DZViewController.h"

@interface DZViewController ()
{
    NSMutableDictionary* infoDictionary;
}
@end

@implementation DZViewController

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
    infoDictionary = [NSMutableDictionary new];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSString* x = !self.originX.text || [self.originX.text isEqualToString:@""] ?  @"0":self.originX.text ;
    NSString* y = !self.originY.text || [self.originY.text isEqualToString:@""]?  @"0": self.originY.text ;
    NSString* width = !self.width.text || [self.width.text isEqualToString:@""]?  @"0":self.width.text ;
    NSString* height = !self.height.text || [self.height.text isEqualToString:@""]?  @"0":self.height.text ;
    
    NSString* rect = [NSString stringWithFormat:@"{{%f,%f},{%f,%f}}", [x floatValue], [y floatValue], [width floatValue], [height floatValue]];
    
    NSString* alpha = !self.alpha.text || [self.alpha.text isEqualToString:@""] ?  @"1": self.alpha.text;
    
    NSSet* params = [[DZConfigureData shareInstance] configureData][self.spriteName][kWizParallerChangedParamers];
    
    NSMutableDictionary* dic = [NSMutableDictionary new];
    if ([params containsObject:kWizParallerAlpha]) {
        [dic setObject:[NSNumber numberWithFloat:[alpha floatValue]] forKey:kWizParallerAlpha];
    }
    
    if ([params containsObject:kWizParallerRect]) {
        [dic setObject:rect forKey:kWizParallerRect];
    }
    [[DZConfigureData shareInstance] configureData][self.spriteName][self.pageCountStr] = dic;
    NSLog(@"%@",[[DZConfigureData shareInstance] configureData]);
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDictionary* dic = [[DZConfigureData shareInstance] configureData][self.spriteName][self.pageCountStr] ;
    self.name.text = self.spriteName;
    self.page.text = self.pageCountStr;
    //
    CGRect rect = CGRectFromString(dic[kWizParallerRect]);
    self.originX.text = [@(rect.origin.x) stringValue];
    self.originY.text = [@(rect.origin.y) stringValue];
    self.width.text = [@(rect.size.width) stringValue];
    self.height.text = [@(rect.size.height) stringValue];
    //
    id object = dic[kWizParallerAlpha];
    if ([object isKindOfClass:[NSNumber class]]) {
        self.alpha.text = [object stringValue];
    }
    else if ([object isKindOfClass:[NSString class]])
    {
        self.alpha.text = object;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
