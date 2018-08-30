//
//  RDetailViewController.m
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RDetailViewController.h"

@interface RDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateField;

@end

@implementation RDetailViewController

-(id) init {
    self = [super init];
    if(self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"DetailView";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    RItem *item = self.item;
    self.nameField.text = item._itemName;
    self.serialField.text = item._serialNumber;
    self.valueField.text = [ NSString stringWithFormat:@"%d",item._valueInDollars];
    
    
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    RItem *item = self.item;
    item._itemName = self.nameField.text;
    item._serialNumber = self.serialField.text;
    item._valueInDollars = [self.valueField.text intValue];
    
    
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
