//
//  RReminderViewController.m
//  OneApp
//
//  Created by lijunjie on 29/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RReminderViewController.h"

@interface RReminderViewController ()

@end

@implementation RReminderViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
    }
    
    return (self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Settings a reminder for %@",date);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
