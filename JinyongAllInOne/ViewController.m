//
//  ViewController.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/5.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "ViewController.h"
#import "BookMasterViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	
	self.navigationController.navigationBarHidden = YES;
	
    
    
}

- (IBAction)readBook {
	BookMasterViewController *master = [self.storyboard instantiateViewControllerWithIdentifier:@"BookMasterViewController"];
//	[self.navigationController pushViewController:master animated:YES];
	
	[self presentViewController:master animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}



@end
