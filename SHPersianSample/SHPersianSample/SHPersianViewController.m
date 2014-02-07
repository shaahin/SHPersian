//
//  SHPersianViewController.m
//  SHPersianSample
//
//  Created by Shahin on 2/8/14.
//  Copyright (c) 2014 Shaahin.us. All rights reserved.
//

#import "SHPersianViewController.h"
#import "SHLabel.h"

@interface SHPersianViewController ()
@property (weak, nonatomic) IBOutlet SHLabel *testLabel;

@end

@implementation SHPersianViewController

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
    
    [self.testLabel setText:@"لورم ایپسوم متنی است که ساختگی برای طراحی و چاپ آن مورد است. صنعت چاپ زمانی لازم بود شرایطی شما"];
    [self.testLabel resizeToFitText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
