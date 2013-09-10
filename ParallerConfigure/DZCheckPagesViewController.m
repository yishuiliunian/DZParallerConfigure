//
//  DZCheckPagesViewController.m
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import "DZCheckPagesViewController.h"
#import "DZViewController.h"
#import "DZPageCheckViewController.h"
@interface DZCheckPagesViewController ()

@end

@implementation DZCheckPagesViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZPageCheckViewController* vc = [[DZPageCheckViewController alloc] init];
    vc.pageCountStr = [@(indexPath.row) stringValue];
    [self.navigationController pushViewController:vc  animated:YES];
}
@end
